package issue.controller.bean;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import issue.model.dao.IssueDAOImpl;
import issue.model.vo.IssueVO;

@Controller
@RequestMapping("/issue/")
public class IssueBean {
	
	@Autowired
	private IssueDAOImpl issueDAO = null;
	
	@RequestMapping("issueBoard.do")
	public String issueBoard(String pageNum, Model model) throws Exception {
		
//		HttpHeaders responseHeaders = new HttpHeaders();
//		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
//		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		if(pageNum == null) {
			pageNum = "1";
		}
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List issueList = null;
		count = issueDAO.getArticleCount();
		if(count > 0) {
			issueList = issueDAO.getArticles(startRow, endRow);
		}else {
			issueList = Collections.EMPTY_LIST;	// null 대신 처리
		}
		number = count - (currentPage - 1) * pageSize;
		
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", startRow);
		model.addAttribute("endRow", endRow);
		model.addAttribute("count", count);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("issueList", issueList);
		model.addAttribute("number", number);
		
		return "issue/issueBoard";
	}
	
	
	@RequestMapping("issueBoardWriteForm.do")
	public String issueBoardWriteForm(@ModelAttribute("vo") IssueVO vo) {
		System.out.println("11111111111");
		return "adminIssue/issueBoardWriteForm";
	}
	
	
	@RequestMapping("issueBoardWritePro.do")
	public String issueBoardWritePro(IssueVO vo) throws Exception{
		
		issueDAO.insertArticle(vo);
		
		return "issue/issueBoard";
	}
	
	
	@RequestMapping("issueBoardMainModifyForm.do")
	public String modifyForm(int num, String pageNum, Model model) throws Exception{
		
		IssueVO issue = issueDAO.getArticleForUpdate(num);
		
		model.addAttribute("issue", issue);
		model.addAttribute("pageNum", pageNum);
		
		return "adminIssue/issueBoardMainModifyForm";
	}
	
	
	@RequestMapping("issueBoardMainModifyPro.do")
	public String modifyPro(IssueVO vo, String pageNum) throws Exception{
		
		issueDAO.updateArticle(vo);
		
		return "issue/issueBoard";
	}
	
	
	@RequestMapping("issueBoardMainDeleteForm.do")
	public String deleteForm(int num, String pageNum, Model model) {
		
		model.addAttribute("num", num);
		model.addAttribute("pageNum", pageNum);
		
		return "adminIssue/issueBoardMainDeleteForm";
	}
	
	
	@RequestMapping("issueBoardMainDeletePro.do")
	public String deletePro(int num, String pageNum) throws Exception{
		
		issueDAO.deleteArticle(num);
		
		return "issue/issueBoard";
	}
	
	
	@RequestMapping("issueBoardMain.do")
	public String issueBoardMain(int num, int pageNum, Model model) throws Exception {
		IssueVO issue = issueDAO.getArticle(num);
		model.addAttribute("num", num);
		model.addAttribute("issue", issue);
		model.addAttribute("pageNum", pageNum);
		return "issue/issueBoardMain";
	}
	
	
	@RequestMapping("issueBoardMainReplePro.do")
	@ResponseBody
	public String issueBoardMainReplePro(@RequestParam("inlineRadioOptions")int td, IssueVO vo, HttpSession session) throws Exception {
		
		vo.setWriter((String)session.getAttribute("sId"));
		
		if(td == 1) {	// 여당
			vo.setTda(1);
			int tdaCount = issueDAO.getTdaCount(vo.getNum());
			tdaCount += 1;
			issueDAO.plusTdaCount(vo.getNum(), tdaCount);			
		}else if(td == -1) {	// 야당
			vo.setTda(-1);
			int tdcCount = issueDAO.getTdcCount(vo.getNum());
			tdcCount += 1;
			issueDAO.plusTdcCount(vo.getNum(), tdcCount);
		}else if(td == 0) {		// 중립
			vo.setTda(0);
			int tdbCount = issueDAO.getTdbCount(vo.getNum());
			tdbCount += 1;
			issueDAO.plusTdbCount(vo.getNum(), tdbCount);
		}
		issueDAO.insertReple(vo);
		
		return "success";
	}
	
	
	@RequestMapping(value = "issueBoardMainList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity issueBoardMainList(HttpServletResponse response, IssueVO vo, int num, int pageNum, Model md) throws Exception {
		
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		count = issueDAO.getRepleCount(num);
		
		List<IssueVO> list = null;
		
		if(count > 0) {
			list = issueDAO.getReples(startRow, endRow, num);
		}else {
			list = Collections.EMPTY_LIST;
		}
				
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				HashMap hm = new HashMap();
				hm.put("num", list.get(i).getNum());
				hm.put("ref", list.get(i).getRef());
				hm.put("ben", list.get(i).getBen());
				hm.put("content", list.get(i).getContent());				
				hm.put("re_level", list.get(i).getRe_level());
				hm.put("re_step", list.get(i).getRe_step());
				hm.put("reg", list.get(i).getReg());
				
				hmlist.add(hm);				
			}
		}

		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		
	}
	
	
	@RequestMapping(value="issueBoardMainGraph.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity debateGetGraphData(HttpServletResponse response, IssueVO vo, int num, Model md) throws Exception{
				
		List<IssueVO> list = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		HashMap hm = new HashMap();
		
		double tdaPercent = 0;
		double tdcPercent = 0;
		double tdbPercent = 0;
		
		if(issueDAO.getTdaCount(num)>0) {
			tdaPercent = Math.round((100*(double)issueDAO.getTdaCount(num)/((double)issueDAO.getTdaCount(num)+(double)issueDAO.getTdcCount(num)+(double)issueDAO.getTdbCount(num))));
		}
		if(issueDAO.getTdbCount(num)>0) {
			tdbPercent = Math.round((100*(double)issueDAO.getTdbCount(num)/((double)issueDAO.getTdaCount(num)+(double)issueDAO.getTdcCount(num)+(double)issueDAO.getTdbCount(num))));
		}
		if(issueDAO.getTdcCount(num)>0) {
			tdcPercent = Math.round((100*(double)issueDAO.getTdcCount(num)/((double)issueDAO.getTdaCount(num)+(double)issueDAO.getTdcCount(num)+(double)issueDAO.getTdbCount(num))));
		}
		
		hm.put("tda", tdaPercent);
		hm.put("tdc", tdcPercent);
		hm.put("tdb", tdbPercent);
		
		hmlist.add(hm);	
		
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	@RequestMapping(value="voteCheck.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity voteCheck(HttpSession session ,HttpServletResponse response, int num, Model md) throws Exception{
				
		List<IssueVO> list = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		HashMap hm = new HashMap();
		
		// 로직 작성
		// 투표 여부 check
		int check = 0;
		if(session.getAttribute("sId") != null) {
			check = issueDAO.checkVote(num, (String)session.getAttribute("sId"));
		}
		
		// 로직 작성
		
		hm.put("check", check);
		
		hmlist.add(hm);	
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	
	@RequestMapping("issueRepleDelete.do")
	@ResponseBody
	public String debateDeleteReple(IssueVO vo) throws Exception {
		
		int ref = issueDAO.getRef(vo);
		int vote = issueDAO.getVote(vo);
		issueDAO.updateDebate(ref, vote);
		issueDAO.deleteReple(vo);
		
		return "success";
	}


	

}













