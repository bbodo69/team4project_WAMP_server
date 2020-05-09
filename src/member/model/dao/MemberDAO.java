package member.model.dao;

import java.util.List;

import member.model.vo.MemberVO;

public interface MemberDAO {

	public void insertMember(MemberVO vo) throws Exception;
	
	public int idPwCheck(MemberVO vo) throws Exception;
	
	public List selectAll() throws Exception;
	
	public MemberVO selectMember(String id) throws Exception;
	
	public void updateMember(MemberVO vo) throws Exception;
	
	public void deleteMember(MemberVO vo) throws Exception;
	
}
