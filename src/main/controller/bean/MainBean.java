package main.controller.bean;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import debate.model.dao.DebateDAOImple;
import main.model.dao.MainDAOImple;
import main.model.vo.MainVO;

@Controller
@RequestMapping("/main/")
public class MainBean {
	
	

	@Autowired
	private MainDAOImple mainDAO = new MainDAOImple();
	
	@Autowired
	private DebateDAOImple debateDAO = null;
	
	@RequestMapping("login.do")
	public String login(HttpSession session, MainVO vo, Model md) throws Exception {
		
		session.setAttribute("sId", vo.getId());
		vo = mainDAO.getDebateArticle();
		int countOkNok = mainDAO.countMaxDebateArticle();
		int maxOk = mainDAO.okMax();
		int maxNok = mainDAO.NokMax();
		
		List debate;
		debate = mainDAO.getDebateArticles();
		List issue;
		issue = mainDAO.getIssueArticle();
		List commitment;
		commitment = mainDAO.getCommitmentArticle();
		md.addAttribute("debate", debate);
		md.addAttribute("issue", issue);
		md.addAttribute("commitment", commitment);
		
		md.addAttribute("vo", vo);
		md.addAttribute("count", countOkNok);
		md.addAttribute("maxOk", maxOk);
		md.addAttribute("maxNok", maxNok);
				
		return "main/main";
		
	}
	
	@RequestMapping("main.do")
	public String main(MainVO vo, Model md) throws Exception {
		
		List debate;
		debate = mainDAO.getDebateArticles();
		List issue;
		issue = mainDAO.getIssueArticle();
		List commitment;
		commitment = mainDAO.getCommitmentArticle();
		md.addAttribute("debate", debate);
		md.addAttribute("issue", issue);
		md.addAttribute("commitment", commitment);
		
		return "main/main";
	}
	
	@RequestMapping("logout.do")
	public String logout(MainVO vo, HttpServletRequest request, Model md) throws Exception {
		
		vo = mainDAO.getDebateArticle();
		int countOkNok = mainDAO.countMaxDebateArticle();
		int maxOk = mainDAO.okMax();
		int maxNok = mainDAO.NokMax();
		
		List debate;
		debate = mainDAO.getDebateArticles();
		List issue;
		issue = mainDAO.getIssueArticle();
		List commitment;
		commitment = mainDAO.getCommitmentArticle();
		md.addAttribute("debate", debate);
		md.addAttribute("issue", issue);
		md.addAttribute("commitment", commitment);
		
		md.addAttribute("vo", vo);
		md.addAttribute("count", countOkNok);
		md.addAttribute("maxOk", maxOk);
		md.addAttribute("maxNok", maxNok);
		
		request.getSession().invalidate();
		
		return "main/main";
	}
}