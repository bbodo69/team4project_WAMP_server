package issue.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import issue.model.vo.IssueVO;

public class IssueDAOImpl implements IssueDAO{
	
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public void insertArticle(IssueVO vo) throws Exception {
		// 새 글
		sqlSession.insert("issue.insertArticle", vo);
	}
	
	
	@Override
	public IssueVO getArticleForUpdate(int num) throws Exception {
		
		IssueVO issue = (IssueVO)sqlSession.selectOne("issue.selectOne", num);
		
		return issue;
	}

	@Override
	public void updateArticle(IssueVO vo) throws Exception {
		
		sqlSession.update("issue.updateArticle");
		
	}
	
	
	@Override
	public void deleteArticle(int num) throws Exception {
		
		sqlSession.delete("issue.deleteOne", num);
		
	}
	

	@Override
	public int getArticleCount() throws Exception {
		int count = (Integer)sqlSession.selectOne("issue.countAll");
		
		return count;
	}
	

	@Override
	public List getArticles(int start, int end) throws Exception {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List list = sqlSession.selectList("issue.selectAll", map);
		
		return list;
	}
	

	@Override
	public IssueVO getArticle(int num) throws Exception {
		// issueBoard 페이지의 언론사 조회수 올리고
		sqlSession.update("issue.updateReadcount", num);
		// 글 고유번호 받은 것을 parameter로 던져주면서 게시글 한 개의 전체 내용 받아오기
		IssueVO issue = (IssueVO)sqlSession.selectOne("issue.selectOne", num);

		return issue;
	}
	
	
	public int getTdaCount(int ref) throws Exception {
		
		int tdaCount = sqlSession.selectOne("issue.getTdaCount", ref);
		
		return tdaCount;
	}
	
	
	public int getTdcCount(int ref) throws Exception{
		
		int tdcCount = sqlSession.selectOne("issue.getTdcCount", ref);
		
		return tdcCount;
	}
	
	
	public int getTdbCount(int ref) throws Exception{
		
		int tdbCount = sqlSession.selectOne("issue.getTdbCount", ref);
		
		return tdbCount;
	}
	
	
	public void plusTdaCount(int num, int tdaCount) throws Exception {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("count", tdaCount);
		sqlSession.update("issue.plusTdaCount", map);
		
	}
	
	
	public void plusTdcCount(int num, int tdcCount) throws Exception {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("count", tdcCount);
		sqlSession.update("issue.plusTdcCount", map);
		
	}
	
	
	public void plusTdbCount(int num, int tdbCount) throws Exception {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("count", tdbCount);
		sqlSession.update("issue.plusTdbCount", map);
		
	}
	
	
	public void insertReple(IssueVO vo) throws Exception{
		
		sqlSession.insert("issue.insertReple", vo);
		
	}
	
	
	public int getRepleCount(int num) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);			
		int count = (Integer)sqlSession.selectOne("issue.repleCount", map);
		
		return count;
	}
	
	
	public List getReples(int num) throws Exception{
		
		List list = sqlSession.selectList("issue.selectRepleList", num);
		
		return list;
		
	}
	
	
	public List getReples(int start, int end, int num) throws Exception{
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("num", num);
		List list = sqlSession.selectList("issue.repleSelectAll", map);
				
		return list;
	}
	
	
	public int checkVote(int num, String sId) throws Exception {

		int check = 0;
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("sId", sId);
		check = sqlSession.selectOne("issue.checkVote", map);
		
		return check;
	}
	
	
	public void deleteReple(IssueVO vo) throws Exception{

		sqlSession.delete("issue.deleteReple", vo);

	}
	
	
	public int getRef(IssueVO vo) throws Exception{
		
		int ref = sqlSession.selectOne("issue.getRef", vo);
		
		return ref;
	}
	
	
	public int getVote(IssueVO vo) throws Exception{
		
		int vote = sqlSession.selectOne("issue.getVote", vo);
		
		return vote;
	}
	
	
	public void updateDebate(int ref, int td) throws Exception{
		
		if(td==1) {
			sqlSession.update("issue.minusTda", ref);
		}else if(td == -1) {
			sqlSession.update("issue.minusTdc", ref);
		}else if(td == 0) {
			sqlSession.update("issue.minusTdb", ref);
		}
	}


//	@Override
//	public int updateArticle(IssueVO vo) throws Exception {
//		
//		int x = -1;
//		String dbpw = (String)sqlSession.selectOne("issue.selectPw", vo.getNum());
//		if(dbpw != null) {
//			if(dbpw.equals(vo.getPw())) {
//				sqlSession.update("board.updateOne", vo);
//				x = 1;
//			}else {
//				x = 0;	// 비번 오류
//			}
//		}	
//		return x;
//	}
	

//	@Override
//	public int deleteArticle(int num) throws Exception {
//		
//		int x = -1;
//		String dbpw = (String)sqlSession.selectOne("issue.selectPw", num);
//		if(dbpw != null) {
//			if(dbpw.equals(passwd)) {
//				sqlSession.delete("board.deleteOne", num);
//				x = 1;
//			}else {
//				x = 0;
//			}
//		}
//		
//		return x;
//	}
	
}
