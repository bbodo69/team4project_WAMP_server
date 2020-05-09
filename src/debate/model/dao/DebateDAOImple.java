package debate.model.dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import debate.model.vo.DebateVO;

public class DebateDAOImple implements DebateDAO{

	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public String getDebateArticle(int num) throws Exception{
		
		
		return "";
	}
	
	public int getArticleCount() throws Exception{
	
		int count = (Integer)sqlSession.selectOne("debate.countAll");
		return count;
	}
	
	
	public void insertDebate(DebateVO vo) throws Exception{
		
		sqlSession.insert("debate.insertDebate", vo);
				
	}

	
	public int getReadcount(int num) throws Exception{
		
			int readcount = sqlSession.selectOne("debate.getReadcount", num);
		
		return readcount;
	}
	
	public void insertReple(DebateVO vo) throws Exception{
		
		vo.setRef2(sqlSession.selectOne("debate.getRepleNum")); 
		sqlSession.insert("debate.insertReple", vo);
	}
	
	public void insertReReple(DebateVO vo) throws Exception{
		
		int ref2 = 0;
		int level = 0;
		int step = 0;
		int maxStep = 0;
		int maxLevel = 0;
		int num = vo.getNum();
		int ref = vo.getRef();
		
		if(sqlSession.selectOne("debate.getRef2", vo)==null) {
			ref2 = 0;
		}else {
			ref2 = sqlSession.selectOne("debate.getRef2", vo);
		}
		
		vo.setRef2(ref2);
		vo.setRe_level(level);
		vo.setRe_step(step);

		step = sqlSession.selectOne("debate.getStep", vo);
		level = sqlSession.selectOne("debate.getLevel", vo);
		
		maxLevel = sqlSession.selectOne("debate.maxGetLevel", vo);
		
		vo.setRef2(ref2);
		vo.setRe_level(level);
		vo.setRe_step(step);
		
		int ok = 0;
		
 		if(sqlSession.selectOne("debate.getOk", vo) != null) {
			ok = sqlSession.selectOne("debate.getOk", vo);
		};
		
		if(ok == 1) {
			vo.setOk(2);
		}else if(ok == -1) {
			vo.setOk(-2);
		}else if(ok == 2){
			vo.setOk(3);
		}else if(ok == -2) {
			vo.setOk(-3);
		}else {
			System.out.println("????");
		}
			
			if(step == 0 && level != 0) {
				maxStep = sqlSession.selectOne("debate.maxGetStep", vo);
				vo.setRe_level(level);
				vo.setRe_step(maxStep+1);
				sqlSession.insert("debate.insertStep", vo);
			}else if(vo.getNum() == ref2) {
				vo.setRe_level(maxLevel+1);
				sqlSession.insert("debate.insertLevel", vo);
			}
		
	}
	
	public List getArticleList(int start, int end) throws Exception{
		
		HashMap map = new HashMap();
		map.put("start", start-1);
		map.put("end", end-1);		
		List list = sqlSession.selectList("debate.selectAll", map);
				
		return list;
	}
	
	
	public DebateVO getArticle(int num) throws Exception{
				
		DebateVO vo = new DebateVO();
		vo = sqlSession.selectOne("debate.getArticle", num);
		int readcount = vo.getReadcount() + 1;
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("readcount", readcount);
		sqlSession.update("plusReadCount", map);
				
		return vo;
	}
	
	public DebateVO getArticle(int startRow, int endRow) throws Exception{
		
		DebateVO vo = new DebateVO();
		
		
		return vo;
	}
	
	public int getOkCount(int ref) throws Exception{
		
		int okCount = sqlSession.selectOne("debate.getOkCount", ref);
		return okCount;
	}
	
	public int getNokCount(int ref) throws Exception{
		
		int NokCount = sqlSession.selectOne("debate.getNokCount", ref);
		
		return NokCount;
	}
	
	public void plusOkCount(int num, int okCount) throws Exception {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("count", okCount);
		sqlSession.update("plusOkCount", map);
		
	}
	
	public void plusNokCount(int num, int NokCount) throws Exception {
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("count", NokCount);
		sqlSession.update("plusNokCount", map);
		
	}
	
//	public List getArticleList(int start, int end) throws Exception{
//		
//		HashMap map = new HashMap();
//		map.put("start", start);
//		map.put("end", end);		
//		List list = sqlSession.selectList("debate.selectAll", map);
//				
//		return list;
//	}
	
	public int getRepleCount(int num) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);			
		int count = (Integer)sqlSession.selectOne("debate.repleCount", map);
		
		return count;
	}
	

	public List getReples(int num) throws Exception{
		
		List list = sqlSession.selectList("debate.selectRepleList", num);
		
		return list;
		
	}
	
	public List getReples(int start, int end, int num) throws Exception{
		
		HashMap map = new HashMap();
		map.put("start", start-1);
		map.put("end", end-1);
		map.put("num", num);
		
		List list = sqlSession.selectList("debate.repleSelectAll", map);
		System.out.println(list);
		return list;
		
	}
	
	public int checkVote(int num, String sId) throws Exception {

		int check = 0;
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("sId", sId);
		check = sqlSession.selectOne("debate.checkVote", map);
		System.out.println(check + " dao");
		
		return check;
	}
	
	public void deleteReple(DebateVO vo) throws Exception{
		sqlSession.delete("debate.deleteReple", vo);
	}
	
	public int getRef(DebateVO vo) throws Exception{
		
		int ref = sqlSession.selectOne("debate.getRef", vo);
		
		return ref;
	}
	
	public int getVote(DebateVO vo) throws Exception{
		
		int vote = sqlSession.selectOne("debate.getVote", vo);
		
		return vote;
	}
	
	public void updateDebate(int ref, int ok) throws Exception{
		
		if(ok==1) {
			sqlSession.update("debate.minusOk", ref);
		}else if(ok == -1) {
			sqlSession.update("debate.minusNok", ref);
		}
	}
	
	public void like(int num, int ref, String sId) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		map.put("sId", sId);
		sqlSession.insert("debate.like", map);
		
		map.put("num", ref);
		map.put("ref", num);
		int count = sqlSession.selectOne("debate.likeCount", map);
		// �뿬湲곗꽌 �삤瑜�
		map.put("count", count);
		sqlSession.update("debate.updateLike", map);
	}
	
	public void unlike(int num, int ref, String sId) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		map.put("sId", sId);
		sqlSession.insert("debate.unlike", map);
		
		map.put("num", ref);
		map.put("ref", num);
		int count = sqlSession.selectOne("debate.unlikeCount", map);
		map.put("count", count);
		sqlSession.update("debate.updateUnlike", map);
		
	}
	
	public void likeCancel(int num, int ref, String sId) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		map.put("sId", sId);
		sqlSession.insert("debate.likeCancel", map);
		
		map.put("num", ref);
		map.put("ref", num);
		int count = sqlSession.selectOne("debate.likeCount", map);
		map.put("count", count);
		sqlSession.update("debate.updateLike", map);
	}

	public void unlikeCancel(int num, int ref, String sId) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		map.put("sId", sId);
		sqlSession.insert("debate.unlikeCancel", map);
		
		map.put("num", ref);
		map.put("ref", num);
		int count = sqlSession.selectOne("debate.unlikeCount", map);
		map.put("count", count);
		sqlSession.update("debate.updateUnlike", map);
	}
	
	public int likeCheck(int num, int ref, String sId) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		map.put("sId", sId);
		int check = 0;
		
		if(sqlSession.selectOne("debate.checkLike", map) != null) {
			check = sqlSession.selectOne("debate.checkLike", map);
		}
		return check;
	}
	
	public int likeCount(int num, int ref) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		int count = 0;
		
		if(sqlSession.selectOne("debate.likeCount", map) != null) {
			count = sqlSession.selectOne("debate.likeCount", map);
		}
		
		return count;
	}
	
	public int unlikeCount(int num, int ref) throws Exception{
		
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("ref", ref);
		int count = 0;
		
		if(sqlSession.selectOne("debate.unlikeCount", map) != null) {
			count = sqlSession.selectOne("debate.unlikeCount", map);
		}
		
		return count;
	}
	
	public DebateVO topOkView(DebateVO vo) throws Exception{
		
		DebateVO article = sqlSession.selectOne("debate.topOkView", vo);
		
		return article;
	}
	
	public DebateVO topNokView(DebateVO vo) throws Exception{

		DebateVO article = sqlSession.selectOne("debate.topNokView", vo);
		
		return article;
	}	
	
}
