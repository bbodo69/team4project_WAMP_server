package member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import member.model.vo.MemberVO;

public class MemberDAOImpl implements MemberDAO{

	
	
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertMember(MemberVO vo) throws Exception {
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		System.out.println(vo.getGender());
		System.out.println(vo.getName());
		System.out.println(vo.getAge());
		System.out.println(vo.getQa1());
		System.out.println(vo.getQa2());
		System.out.println(vo.getTd());
		System.out.println(vo.getEmail());
		sqlSession.insert("member.insertMember", vo);
		System.out.println("�젙�긽�옉�룞");
		
	}
	
	@Override
	public int idPwCheck(MemberVO vo) throws Exception {
		int check = (Integer)sqlSession.selectOne("member.idPwCheck", vo);
		System.out.println("媛��룞");
		return check;
		
	}

	@Override
	public List selectAll() throws Exception {

		return null;
	}

	@Override
	public MemberVO selectMember(String sId) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setId(sId);
		vo = (MemberVO)sqlSession.selectOne("member.selectMember", sId);	// selectOne 荑쇰━寃곌낵媛� �뾾�쑝硫� null媛� 諛섑솚. 荑쇰━ 寃곌낵濡� �젅肄붾뱶 媛� �븳媛쒕쭔 �굹���빞�븳�떎! DB�뿉 �젅肄붾뱶媛� �븯�굹留� �엳�뒗 寃쎌슦留� �궗�슜媛��뒫
		return vo;															// �떎�닔�쓽 �젅肄붾뱶媛� �엳�쓣 寃쎌슦 TooManyResultsException �뿉�윭 諛쒖깮. selectList�� 援щ텇�빐�꽌 �궗�슜�빐�빞�븳�떎!
	}

	@Override
	public void updateMember(MemberVO vo) throws Exception {
		sqlSession.update("member.updateMember", vo);		
		System.out.println(vo.getId());
		System.out.println(vo.getPw());
		System.out.println(vo.getQa1());
		System.out.println(vo.getQa2());
		System.out.println(vo.getTd());
		System.out.println(vo.getEmail());
	}

	@Override
	public void deleteMember(MemberVO vo) throws Exception {
		sqlSession.delete("member.deleteMember", vo);
		
	}

	public int checkId(String id) {
		
		int check = 0 ;
		if(sqlSession.selectOne("member.checkId", id) != null) {
			check = 1;
		}
		
		return check;
	}


	
}

