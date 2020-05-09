package issue.model.dao;

import java.util.List;

import issue.model.vo.IssueVO;

public interface IssueDAO {
	
	// 게시글 저장
	public void insertArticle(IssueVO vo) throws Exception;
	
	// 게시글 수정용으로 글 한개 정보 가져오기 (조회수 안올라감)
	public IssueVO getArticleForUpdate(int num) throws Exception;
	
	// 게시글 수정하기
	public void updateArticle(IssueVO vo) throws Exception;
	
	// 게시글 삭제하기
	public void deleteArticle(int num) throws Exception;
	
	// 전체글 개수 검색
	public int getArticleCount() throws Exception;
	
	// 게시글 범위지정해서 가져오기
	public List getArticles(int start, int end) throws Exception;
	
	// 기사 클릭시 그 기사 데이터들 가져오기
	public IssueVO getArticle(int num) throws Exception;
	
	// 여당쪽 투표했을 때 여당쪽 데이터 가져오기
	public int getTdaCount(int ref) throws Exception;
	
	// 야당쪽 투표했을 때 야당쪽 데이터 가져오기
	public int getTdcCount(int ref) throws Exception;
	
	// 중립쪽 투표했을 때 중립쪽 데이터 가져오기
	public int getTdbCount(int ref) throws Exception;
	
	// 여당쪽에 +1
	public void plusTdaCount(int num, int tdaCount) throws Exception;
	
	// 야당쪽에 +1
	public void plusTdcCount(int num, int tdcCount) throws Exception;
	
	// 중립쪽에 +1
	public void plusTdbCount(int num, int tdbCount) throws Exception;
	
	// 쓴 댓글 DB에 저장시켜주기
	public void insertReple(IssueVO vo) throws Exception;
	
	// 리플의 전체 개수 검색
	public int getRepleCount(int num) throws Exception;
	
	// 리플의 글내용 가져오기
	public List getReples(int start, int end, int num) throws Exception;
	
	// 투표 체크
	public int checkVote(int num, String sId) throws Exception;
	
	// AJAX로 달았던 댓글 삭제하기
	public void deleteReple(IssueVO vo) throws Exception;
	
	// 해당 vo를 가지고 있는 ref 가져오기
	public int getRef(IssueVO vo) throws Exception;
	
	// 해당 vo를 가지고 있는 td값 가져오기
	public int getVote(IssueVO vo) throws Exception;
	
	// 댓글을 삭제했으므로 해당 게시판의 ref값과 td값에서 차감해주어야 한다.
	public void updateDebate(int ref, int td) throws Exception;
	
	// 게시글 수정
	// public int updateArticle(IssueVO vo) throws Exception;
	
	// 게시글 삭제
	// public int deleteArticle(int num) throws Exception;
}












