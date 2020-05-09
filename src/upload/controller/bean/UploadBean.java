package upload.controller.bean;

import java.io.File;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import upload.model.dao.UploadDAOImple;
import upload.model.vo.UploadVO;

@Controller
@RequestMapping("/upload/")
public class UploadBean {
	
	@Autowired
	private UploadDAOImple uploadDAO = null;
	
	private static final Logger logger = LoggerFactory.getLogger(UploadBean.class);
	
	// xml에 설정된 리소스 참조
	// bean의 id가 uploadPath인 태그를 참조
//	@Resource(name="uploadPath")
//	String uploadPath;
	
	// 업로드 흐름 : 업로드 버틀클릭 => 임시디렉토리에 업로드 => 지정된 디렉토리에 저장 => 파일정보가 file 에 저장
	@RequestMapping(value="uploadForm.do", method=RequestMethod.GET)
	public String uploadForm() {
		
		return "upload/uploadForm";
		
	}
	
//	@RequestMapping(value="a.do", method=RequestMethod.POST)
//	public ModelAndView uploadForm(MultipartFile file, ModelAndView mav) throws Exception{
//		
//		logger.info("파일이름 : "+file.getOriginalFilename());
//		logger.info("파일크기 : " + file.getSize());
//		logger.info("컨텐트 타입 : " + file.getContentType());
//		
//		String savedName = file.getOriginalFilename();
//		
//		File target = new File(uploadPath, savedName);
//		
//		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리에 복사
//		// FileCopyUtiles.copy(바이트배열, 파일객체)
//		FileCopyUtils.copy(file.getBytes(), target);
//		
//		mav.setViewName("upload/uploadResult");
//		mav.addObject("savedName", savedName);
//		
//		return mav; // 결과화면으로 포워딩
//	}
	
	//https://victorydntmd.tistory.com/174 참고
	@RequestMapping(value="uploadPro.do", method=RequestMethod.POST)
	public String uploadResult(Model md, @RequestParam("textFile")MultipartFile textFile) {	// 파일 객체는 multipartFile 객체로 받아주기
		
		String url = uploadDAO.restore(textFile);
		md.addAttribute("url", url);
		
		return "upload/uploadResult";
	}
	
}