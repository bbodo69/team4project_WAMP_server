package debate.model.dao;

import java.util.List;

import debate.model.vo.DebateVO;

public interface DebateDAO {

	public String getDebateArticle(int num) throws Exception;
	
	public int getArticleCount() throws Exception;
	
	public List getArticleList(int startRow, int endRow) throws Exception;
	
	public void insertDebate(DebateVO vo) throws Exception;
	
	public DebateVO getArticle(int num) throws Exception;
	
	public int getReadcount(int num) throws Exception;
	
	public void insertReple(DebateVO vo) throws Exception;
	
	public List getReples(int start, int end, int num) throws Exception;
	
	public int getOkCount(int ref) throws Exception;
	
	public int getNokCount(int ref) throws Exception;
	
	public void plusOkCount(int num, int okCount) throws Exception;
	
	public void plusNokCount(int num, int NokCount) throws Exception;
	
	public int getRepleCount(int num) throws Exception;
	
	public int checkVote(int num, String sId) throws Exception;
	
	public void deleteReple(DebateVO vo) throws Exception;
	
	public int getRef(DebateVO vo) throws Exception;
	
	public int getVote(DebateVO vo) throws Exception;
	
	public void updateDebate(int ref, int ok) throws Exception;
	
	public void like(int num, int ref, String sId) throws Exception;
	
	public void unlike(int num, int ref, String sId) throws Exception;
	
	public void likeCancel(int num, int ref, String sId) throws Exception;

	public void unlikeCancel(int num, int ref, String sId) throws Exception;
	
	public int likeCheck(int num, int ref, String sId) throws Exception;
	
	public int likeCount(int num, int ref) throws Exception;

	public int unlikeCount(int num, int ref) throws Exception;
	
}
