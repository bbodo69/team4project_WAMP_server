package member.controller.bean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import member.model.dao.MemberDAO;
import member.model.dao.MemberDAOImpl;
import member.model.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberBean {

	@Autowired
	private MemberDAOImpl memberDAO = null;
	private Object dto;
	private Object check;
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	@RequestMapping("signupForm.do")
	public String signupForm() {
		
		return "member/signupForm";
	}
									
	@RequestMapping("signupPro.do")
	public String signupPro(MemberVO vo) throws Exception{
		
		String checkId = null;
		
		int check = memberDAO.checkId(vo.getId());
		
		if(check == 0) {
			memberDAO.insertMember(vo);
		}else {
			return "main/checkId";
		}
		
		return "main/main";
	}
	
	@RequestMapping("modifyForm.do")
	public String modifyForm(String sId, Model model, MemberVO vo, HttpSession session) throws Exception{
		// 媛믪쓣 諛쏆쑝�젮硫� check�뿉 sId瑜� ���옣�븳�떎. session媛믪쓣 遺덈윭�삤�젮硫� getAttribute瑜� �궗�슜. login�븷 �븣 sessionScpoe.sId瑜� �궗�슜�뻽�쑝誘�濡� sId瑜� 媛��졇�삩�떎.		
		check = session.getAttribute("sId");
		// memberDAO�뒗 MemberDAOImpl�쓽 硫붿꽌�뱶瑜� �궗�슜�븷 �닔 �엳�떎. 泥섏쓬�뿏 null媛�. selectMember�뒗   
		vo = memberDAO.selectMember((String)check);
		
		vo.getId();
		vo.getPw();
		vo.getGender();
		vo.getName();
		vo.getAge();
		vo.getQa1();
		vo.getQa2();
		vo.getTd();
		vo.getEmail();
				
		model.addAttribute("dto", vo);
		
		return "member/modifyForm";
	}
	@RequestMapping("modifyPro.do")
	public String modifyPro(MemberVO vo) throws Exception{

		memberDAO.updateMember(vo);
		
		return "member/modifyPro";
	}
	
	@RequestMapping("deleteForm.do")
	public String deleteForm(String sId, MemberVO vo, Model model, HttpSession session) throws Exception{
		// check�뿉 sId�꽭�뀡 �젙蹂대�� �떞�뒗�떎.
		check = session.getAttribute("sId");
		// vo�뿉 selectMember濡� check�뿉 �떞湲� sId濡� 紐⑤뱺 �젙蹂대�� 議고쉶�빐�꽌 �떞�뒗�떎.
		vo = memberDAO.selectMember((String)check);
		// vo�뿉�꽌 id�� pw瑜� �떞�뒗�떎.
		vo.getId();
		vo.getPw();
		// addAttribute濡� vo媛믪쓣 dto濡� 紐낅챸�빐�꽌 deleteForm�뿉 蹂대궡二쇨린
		model.addAttribute("dto", vo);
		return "member/deleteForm";
	}
	
	@RequestMapping("deletePro.do")
	public String deletePro(HttpSession session, HttpServletRequest request, MemberVO vo) throws Exception{
		// deleteMember�쓽 荑쇰━臾� delete from member where id=#{id} and pw=#{pw} 瑜� �씠�슜�빐�꽌 id�� pw媛� �씪移섑븯硫� �궘�젣�븯寃� �븯湲�
		memberDAO.deleteMember(vo);
		// �꽭�뀡 臾댄슚�솕�븯湲�.
		session.invalidate();
		
		return "member/deletePro";
		
	}
		
	
	@RequestMapping("main.do")
	public String main() {
		
		return "main/main";
	}
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		
		return "member/loginForm";
	}

	@RequestMapping("loginPro.do")
	public String loginPro(HttpSession session, MemberVO vo, Model model) throws Exception{
		int check = memberDAO.idPwCheck(vo);
		if(check == 1) {session.setAttribute("sId", vo.getId());}
		
		model.addAttribute("check", check);
		
		return "member/loginPro";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		request.getSession().removeAttribute("sId");
		session.invalidate();
		return "member/logout";
	}
	

	
}
