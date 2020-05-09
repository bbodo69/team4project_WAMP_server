package commitmentboard.controller.bean;

import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.authenticator.SavedRequest;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import org.springframework.web.servlet.view.AbstractView;

import com.sun.media.jfxmedia.logging.Logger;

import commitmentboard.model.dao.CommitmentBoardDAOImpl;
import commitmentboard.model.vo.CommitmentBoardVO;

@Controller
@RequestMapping("/adminCommitment/")
public class CommitmentBoradBean {
	
	@Autowired
	private CommitmentBoardDAOImpl boardDAO = null;
	private Object vo;
	
	private static final String SAVE_PATH = "D:\\spring2\\workspace\\team4\\WebContent\\WEB-INF\\views\\upload";
	private static final String PREFIX_PATH = "D:\\spring2\\workspace\\team4\\WebContent\\WEB-INF\\views\\upload";
	
	@RequestMapping("list.do")
	public String list(String pageNum, Model model) throws Exception{
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage + pageSize;
		int count = 0;
		int number = 0;
		
		List articleList = null;
		count = boardDAO.getArticleCount();
		if(count > 0) {
			articleList = boardDAO.getArticles(startRow, endRow);
		}else {
			articleList = Collections.EMPTY_LIST;
		}
		
		number = count - (currentPage-1) * pageSize;
		
		model.addAttribute("currentPage", currentPage);	// 현재페이지
		model.addAttribute("startRow", startRow);		// 스타트페이지
		model.addAttribute("endRow", endRow);			// 끝페이지
		model.addAttribute("count", count);				// db에서 불러온 게시판의 글 갯수들
		model.addAttribute("pageSize", pageSize);		// 페이지 크기
		model.addAttribute("articleList", articleList);	
		model.addAttribute("number", number);
		
		return "adminCommitment/list";
	}
	
	@RequestMapping("adminWrite.do")
	public String adminWrite() throws Exception{

		return "adminCommitment/adminWrite";
	}
	
	@RequestMapping(value = "adminWritePro.do", method = RequestMethod.POST)
	public String adminWritePro(CommitmentBoardVO vo, HttpServletRequest request) throws Exception {
		// 위에 MultipartFile을 사용하지 않는 이유는 이미 VO에 MultipartFile 타입의 변수를 넣었기 때문에 자동으로 읽어온다.
		// 파일 업로드 처리
		String fileName=null;		// photo용
		String fileName1 = null;	// pdf용
		MultipartFile uploadFile = vo.getUploadFile();
		MultipartFile uploadPdf = vo.getUploadPdf();
		System.out.println(uploadPdf);
		String pathFile = "";
		String pathPdf = "";
		if (!uploadFile.isEmpty()) {
			System.out.println(pathFile);
			System.out.println(pathPdf);
			// photo (uploadFile) 용
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);	//확장자 구하기
			UUID uuid = UUID.randomUUID();	//UUID 구하기 (중복막기위한 고유 아이디 구해주는 클래스)
			fileName=uuid+"."+ext; // 저장할 파일이름 완성
			// 실제 파일이 저장될 upload폴더의 위치를 구해서 
			pathFile = request.getRealPath("upload");
			pathFile += ("\\" + fileName);
			uploadFile.transferTo(new File(pathFile)); // 실제 파일 저장
			
			// url(uploadPdf) pdf용
			String originalFileName1 = uploadPdf.getOriginalFilename();
			String ext1 = FilenameUtils.getExtension(originalFileName1);	//확장자 구하기
			UUID uuid1 = UUID.randomUUID();	//UUID 구하기 (중복막기위한 고유 아이디 구해주는 클래스)
			fileName1=uuid1+"."+ext1; // 저장할 파일이름 완성
			// 실제 파일이 저장될 upload폴더의 위치를 구해서 
			pathPdf = request.getRealPath("upload");
			pathPdf += ("\\" + fileName1);
			uploadPdf.transferTo(new File(pathPdf)); // 실제 파일 저장
			
		}
		vo.setPhoto(pathFile);
		vo.setUrl(pathPdf);
		boardDAO.insertArticle(vo);
		
		
		return "adminCommitment/adminWritePro";
	}

	@RequestMapping("content.do")
	public String content(int num, int pageNum, Model model) throws Exception{
		CommitmentBoardVO article = boardDAO.getArticle(num);
		model.addAttribute("article", article);	
		model.addAttribute("pageNum", pageNum);
		
		return "adminCommitment/content";	
	}
	
	@RequestMapping("adminmodifyForm.do")
	public String adminmodifyForm(int num, int pageNum, Model model) throws Exception{
		CommitmentBoardVO article = boardDAO.getArticleForUpdate(num);
		model.addAttribute("num", num);
		model.addAttribute("article", article);
		model.addAttribute("pageNum", pageNum);
		return "adminCommitment/adminmodifyForm";
	}
	
	@RequestMapping("adminmodifyPro.do")
	public String adminmodifyPro(CommitmentBoardVO vo, Model model, int num, String pageNum) throws Exception{
		
		int check = boardDAO.updateArticle(vo);		
		model.addAttribute("check", check);
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		return "adminCommitment/adminmodifyPro";
	}
	
	// 파일 다운로드 요청
    @RequestMapping("download.do")
	public ModelAndView down(int num) throws Exception {
		// 개발자가 원하는 다운받게 할 파일을 연결. 서버에 존재하는 실제 파일 주소를 작성 -> upload할때 DB에 저장 
    	// DB에서 맞는 사람(num)의 pdf img파일 가져와서  new File (//이부분에 대입)
    	System.out.println(num);
    	// DB에서 num의 url 컬럼의 있는 값 가져와서 
    	
    	String url = "";
    	url = boardDAO.downloadCheck(num);

    	System.out.println(url + " = url 입니다");
    	
		File f = new File(url); // 
		// fileDown : xml에 만든 다운로드 비지니스 로직 처리 클래스의 bean 태그 id속성값을 적는다.
		//				페이지 이동이 아니라 DownloadView를 실행하겠다해서 빈으로 연결
		// downloadFile : 파라미터명 지정
		// f : 다운로드받아가게 할 데이터(파일 객체)
		ModelAndView mv = new ModelAndView("fileDown", "downloadFile", f);
		return mv;
	}
    
    // 어차피 삭제하니까 값을 리턴할 필요가 없다.
    @RequestMapping("deletePro.do")
	public String adminmodifyPro(CommitmentBoardVO vo) throws Exception{
    	
    	int num = vo.getNum();
    	
    	System.out.println(num + "1111");
    	boardDAO.deleteArticle(num);
		
		return "adminCommitment/list";
	}
	
}
