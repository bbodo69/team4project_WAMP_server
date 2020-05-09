package commitmentboard.model.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import commitmentboard.model.vo.CommitmentBoardVO;



public interface CommitmentBoardDAO {

	// 관리자가 게시글 저장 
	public void insertArticle(CommitmentBoardVO vo) throws Exception;
	// 전체글 개수 검색
	public int getArticleCount() throws Exception;
	// 게시글 범위지정해 가져오기
	public List getArticles(int start, int end) throws Exception;
	// 게시글 한개 정보 가져오기
	public CommitmentBoardVO getArticle(int num) throws Exception;
	// 게시글 수정용으로 글 한개 정보 가져오기 (조회수 안올라감)
	public CommitmentBoardVO getArticleForUpdate(int num) throws Exception;
	// 게시글 수정하기
	public int updateArticle(CommitmentBoardVO vo) throws Exception;
	// 게시글 삭제
	public int deleteArticle(int num) throws Exception;

	public String downloadCheck(int num) throws Exception;
}
