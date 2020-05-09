package debate.controller.bean;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import debate.model.dao.DebateDAOImple;
import debate.model.vo.DebateVO;


@Controller
@RequestMapping("/debate/")
public class DebateBean{
	
	@Autowired
	private DebateDAOImple debateDAO = null;
	
	@RequestMapping("test.do")
	public String test() {
		
		return "debate/test";
	}

	@RequestMapping("debateBoardMain.do")
	public String List(String pageNum, Model md) throws Exception{

		if(pageNum==null) {
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		List articleList = null;
		count = debateDAO.getArticleCount();
		if(count > 0) {
			articleList = debateDAO.getArticleList(startRow, endRow);	
			System.out.println(startRow);
			System.out.println(endRow);
		}else {
			articleList = Collections.EMPTY_LIST;
		}
		
//		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy년 MM월 dd일 hh시 mm분");
//		String today1 = sdfCurrent.format(debateDAO.topOkView(vo).getReg());
		
		for(int i = 0 ; i < articleList.size(); i++) {
			DebateVO vo = (DebateVO)articleList.get(i);
			
			SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy년 MM월 dd일 hh시 mm분");
			String today = sdfCurrent.format(vo.getReg());
			vo.setRegSetting(today);
		}
		
		md.addAttribute("articleList", articleList);
		number = count - (currentPage-1)*pageSize;
		md.addAttribute("currentPage", currentPage);
		md.addAttribute("startRow", startRow);
		md.addAttribute("endRow", endRow);
		md.addAttribute("count", count);
		md.addAttribute("pageSize", pageSize);
		md.addAttribute("number", number);
		
		return "debate/debateBoardMain";
	}
	
	
	@RequestMapping("debateWriteForm.do")
	public String debateForm() {
				
		return "debate/debateWriteForm";
	}
	
	@RequestMapping("debatePro.do")
	public String debatePro(DebateVO vo) throws Exception {
		
		debateDAO.insertDebate(vo);		
		
		return "main/main";
	}
	
	@RequestMapping("debateReple.do")
	public String debateReple() {
		
		return "debate/debateReple";
	}
	
	@RequestMapping("debateReplePro.do")
	@ResponseBody
	public String debateReplePro(@RequestParam("inlineRadioOptions")int ok, DebateVO vo, HttpSession session) throws Exception {
		
		vo.setWriter((String)session.getAttribute("sId"));
		
		if(ok == 1) {
			vo.setOk(1);						// 由ы뵆 �뿉�꽌 �꽑�깮 ���옣
			int okCount = debateDAO.getOkCount(vo.getNum());	// 李ъ꽦 �닽�옄 爰쇰궡二쇨린
			okCount +=1;
			debateDAO.plusOkCount(vo.getNum(), okCount);
			
		}else if(ok == -1) {
			vo.setOk(-1);
			int NokCount = debateDAO.getNokCount(vo.getNum());	// 諛섎� �닽�옄 爰쇰궡二쇨린
			NokCount +=1;
			debateDAO.plusNokCount(vo.getNum(), NokCount);
		}
		
		debateDAO.insertReple(vo);
		
		return "success";
	}	
	
	@RequestMapping("reReple.do")
	@ResponseBody
	public String reReple(DebateVO vo, HttpSession session) throws Exception {
		
		vo.setWriter((String)session.getAttribute("sId"));
		
		debateDAO.insertReReple(vo);
		
		return "success";
	}	
	
	
	
	@RequestMapping("debateBoard.do")
	public String debateBoard(DebateVO vo, int num, int pageNum, Model md, HttpSession session) throws Exception{
		
		// view �럹�씠吏��뿉 �븘�슂�븳 pagenation �븘�슂 蹂��닔
		
		
		int currentPage = 1;
		int count = debateDAO.getRepleCount(num);
		int pageSize = 5;
		int number = 0;
		
		number = count - (currentPage-1)*pageSize;
		md.addAttribute("currentPage", currentPage);
		md.addAttribute("count", count);
		md.addAttribute("pageSize", pageSize);
		md.addAttribute("number", number);
		
		// view �럹�씠吏��뿉 �븘�슂�븳 pagenation �븘�슂 蹂��닔
		
		vo = debateDAO.getArticle(num);	
		md.addAttribute("pageNum", pageNum);
		md.addAttribute("article", vo);		
		// 투표 여부 check
		if(session.getAttribute("sId") != null) {
			vo.setCheck(debateDAO.checkVote(num, (String)session.getAttribute("sId")));
		}
		
		md.addAttribute("check", vo.getCheck());
		// !투표 여부 check
		
		return "debate/debateBoard";
	}
	
	@RequestMapping(value="debateRepleList.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity debateRepleList(HttpSession session ,HttpServletResponse response, DebateVO vo, int num, int pageNum, Model md) throws Exception{
				
		int pageSize = 10;
		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		
		count = debateDAO.getRepleCount(num);
		// ======================= 좋아요 체크 여부 확인
		int check = 0;
		String sId = (String)session.getAttribute("sId");
		// ======================= 좋아요 수량 데이터
		int likeCount = 0;
		int unlikeCount = 0;
		
		List<DebateVO> list = null;
		
		if(count > 0) {
			list = debateDAO.getReples(startRow, endRow, num);
		}else {
			list = Collections.EMPTY_LIST;
		}
				
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		if(list.size() > 0) {
			for(int i=0; i<list.size(); i++) {
				// ======================= 좋아요 체크 여부 확인
				if(sId == null) {
					check = 0;
				}else if(sId != null && (!sId.equals("admin"))) {
					check = debateDAO.likeCheck(num, list.get(i).getNum(), sId);
				}else if(sId.equals("admin")){				// admin 좋아요 싫어요 마음대로 올리기
					check = 0;
				}
				// ======================= 좋아요 수량 데이터
				likeCount = debateDAO.likeCount(num, list.get(i).getNum());
				unlikeCount = debateDAO.unlikeCount(num, list.get(i).getNum());
				
				HashMap hm = new HashMap();
				hm.put("num", list.get(i).getNum());
				hm.put("ref", list.get(i).getRef());
				hm.put("content", list.get(i).getContent());
				hm.put("ben", list.get(i).getBen());
				hm.put("re_level", list.get(i).getRe_level());
				hm.put("re_step", list.get(i).getRe_step());
				
				SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy년 MM월 dd일 hh시 mm분");
				String today = sdfCurrent.format(list.get(i).getReg());

				hm.put("reg", today);
				hm.put("writer", list.get(i).getWriter());
				hm.put("ok", list.get(i).getOk());
				hm.put("check", check);
				hm.put("likeCount", likeCount);
				hm.put("unlikeCount", unlikeCount);
				hmlist.add(hm);		
			}
		}

		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="debateGetGraphData.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity debateGetGraphData(HttpServletResponse response, DebateVO vo, int num, Model md) throws Exception{
				
		List<DebateVO> list = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		HashMap hm = new HashMap();
		
		double okPercent = 0;
		double NokPercent = 0;
		
		if(debateDAO.getOkCount(num)>0) {
			okPercent = Math.round((100*(double)debateDAO.getOkCount(num)/((double)debateDAO.getOkCount(num)+(double)debateDAO.getNokCount(num))));
		}
		if(debateDAO.getNokCount(num)>0) {
			NokPercent = Math.round((100*(double)debateDAO.getNokCount(num)/((double)debateDAO.getOkCount(num)+(double)debateDAO.getNokCount(num)))); 
		}
		
		if((okPercent+NokPercent) > 100) {
			while(true) {				
				NokPercent -= 1;
				if((okPercent+NokPercent) == 100) {
					break;
				}
			}
		}
		
		hm.put("ok", okPercent);
		hm.put("Nok", NokPercent);
		
		hmlist.add(hm);	
		
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="voteCheck.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity voteCheck(HttpSession session ,HttpServletResponse response, int num, Model md) throws Exception{
				
		List<DebateVO> list = null;
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		HashMap hm = new HashMap();
		
		// 로직 작성
		// 투표 여부 check
		int check = 0;		
		if(session.getAttribute("sId") != null) {
			check = debateDAO.checkVote(num, (String)session.getAttribute("sId"));
			System.out.println(check + " = bean");
		}
		
		// 로직 작성
		
		hm.put("check", check);
		
		hmlist.add(hm);	
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	@RequestMapping("debateRepleDelete.do")
	@ResponseBody
	public String debateDeleteReple(DebateVO vo) throws Exception {
		
		int ref = debateDAO.getRef(vo);
		int vote = debateDAO.getVote(vo);
		debateDAO.updateDebate(ref, vote);
		debateDAO.deleteReple(vo);
		
		return "success";
	}	
	
	@RequestMapping("like.do")
	@ResponseBody
	public String like(int num, int ref, HttpSession session) throws Exception {
		
		debateDAO.like(num, ref, (String)session.getAttribute("sId"));
		return "success";
	}
	
	@RequestMapping("unlike.do")
	@ResponseBody
	public String unlike(int num, int ref, HttpSession session) throws Exception {
		
		debateDAO.unlike(num, ref, (String)session.getAttribute("sId"));
		return "success";
	}
	
	@RequestMapping("likeCancel.do")
	@ResponseBody
	public String likeCancel(int num, int ref, HttpSession session) throws Exception {
		
		debateDAO.likeCancel(num, ref, (String)session.getAttribute("sId"));
		return "success";
	}
	
	@RequestMapping("unlikeCancel.do")
	@ResponseBody
	public String unlikeCancel(int num, int ref, HttpSession session) throws Exception {
		
		debateDAO.unlikeCancel(num, ref, (String)session.getAttribute("sId"));
		return "success";
	}
	
	
	@RequestMapping(value="topView.do", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity topView(HttpServletResponse response, DebateVO vo, Model md) throws Exception{
			
		List<DebateVO> list = null;
		ArrayList<HashMap> hmlist = new ArrayList();		// 어레이리스트 만들어줘서 나중에 해쉬맵에 vo 데이터 저장후 hm 을 list 에 저장해준다
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
		
		HashMap hm1 = new HashMap();
		hm1.put("favorite", debateDAO.topOkView(vo).getFavorite());
		hm1.put("hate",  debateDAO.topOkView(vo).getHate());
		hm1.put("writer",  debateDAO.topOkView(vo).getWriter());
		hm1.put("content",  debateDAO.topOkView(vo).getContent());
		
		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("yyyy년 MM월 dd일 hh시 mm분");
		String today1 = sdfCurrent.format(debateDAO.topOkView(vo).getReg());
		hm1.put("reg", today1);
		hmlist.add(hm1);
		
		HashMap hm2 = new HashMap();
		hm2.put("favorite", debateDAO.topNokView(vo).getFavorite());
		hm2.put("hate",  debateDAO.topNokView(vo).getHate());
		hm2.put("writer",  debateDAO.topNokView(vo).getWriter());
		hm2.put("content",  debateDAO.topNokView(vo).getContent());
		
		String today2 = sdfCurrent.format(debateDAO.topNokView(vo).getReg());

		hm2.put("reg", today2);
		hm2.put("reg",  debateDAO.topNokView(vo).getReg());
		hmlist.add(hm2);		
		
		JSONArray json = new JSONArray(hmlist);		
		
		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
//	@RequestMapping(value="debateRepleList.do", produces = "application/json; charset=UTF-8")
//	@ResponseBody
//	public ResponseEntity debateRepleList(HttpSession session ,HttpServletResponse response, DebateVO vo, int num, int pageNum, Model md) throws Exception{
//				
//		int pageSize = 10;
//		int currentPage = pageNum;
//		int startRow = (currentPage - 1) * pageSize + 1;
//		int endRow = currentPage * pageSize;
//		int count = 0;
//		int number = 0;
//		
//		count = debateDAO.getRepleCount(num);
//		// ======================= 좋아요 체크 여부 확인
//		int check = 0;
//		String sId = (String)session.getAttribute("sId");
//		// ======================= 좋아요 수량 데이터
//		int likeCount = 0;
//		int unlikeCount = 0;
//		
//		List<DebateVO> list = null;
//		
//		if(count > 0) {
//			list = debateDAO.getReples(startRow, endRow, num);
//		}else {
//			list = Collections.EMPTY_LIST;
//		}
//				
//		HttpHeaders responseHeaders = new HttpHeaders();
//		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
//		responseHeaders.add("Content-Type", "application/json;charset=utf-8");
//		if(list.size() > 0) {
//			for(int i=0; i<list.size(); i++) {
//				// ======================= 좋아요 체크 여부 확인
//				if(sId == null) {
//					check = 0;
//				}else if(sId != null && (!sId.equals("admin"))) {
//					check = debateDAO.likeCheck(num, list.get(i).getNum(), sId);
//				}else if(sId.equals("admin")){				// admin 좋아요 싫어요 마음대로 올리기
//					check = 0;
//				}
//				// ======================= 좋아요 수량 데이터
//				likeCount = debateDAO.likeCount(num, list.get(i).getNum());
//				unlikeCount = debateDAO.unlikeCount(num, list.get(i).getNum());
//				HashMap hm = new HashMap();
//				hm.put("num", list.get(i).getNum());
//				hm.put("ref", list.get(i).getRef());
//				hm.put("content", list.get(i).getContent());
//				hm.put("ben", list.get(i).getBen());
//				hm.put("re_level", list.get(i).getRe_level());
//				hm.put("re_step", list.get(i).getRe_step());
//				hm.put("reg", list.get(i).getReg());
//				hm.put("writer", list.get(i).getWriter());
//				hm.put("ok", list.get(i).getOk());
//				hm.put("check", check);
//				hm.put("likeCount", likeCount);
//				hm.put("unlikeCount", unlikeCount);
//				hmlist.add(hm);		
//			}
//		}
//
//		JSONArray json = new JSONArray(hmlist);		
//		
//		return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
//	}
		
}

