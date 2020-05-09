package commitmentboard.model.dao;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;



import commitmentboard.model.vo.CommitmentBoardVO;

public class CommitmentBoardDAOImpl implements CommitmentBoardDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	@Resource(name="uploadPath")
	String uploadPath;
	

	@Override
	public void insertArticle(CommitmentBoardVO vo) throws Exception {
	// 글번호, 정치인이름, 정치인정당, 지역구, 내용, 원본링크, 사진

		System.out.println("시작");
		int number = 0;
		String numb = (String)sqlSession.selectOne("commitment.maxNum");
		if(numb != null) {
			number = Integer.parseInt(numb) + 1;
		}else {
			number = 1;
		}
	
		System.out.println("중간");
		System.out.println(vo.getNum());
		System.out.println(vo.getName());
		System.out.println(vo.getParty());
		System.out.println(vo.getLocal());
		System.out.println(vo.getContent());
		// 여기부터 이상
		
		System.out.println(vo.getUrl());
		System.out.println(vo.getPhoto());
		sqlSession.insert("commitment.insertArticle", vo);
		
		System.out.println("종료");
	}

	
	@Override
	public int getArticleCount() throws Exception {
		int count = (Integer)sqlSession.selectOne("commitment.countAll");
		
		return count;
	}

	@Override
	public List getArticles(int start, int end) throws Exception {
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List list = sqlSession.selectList("commitment.selectAll", map);
		
		return list;
	}

	@Override
	public CommitmentBoardVO getArticle(int num) throws Exception {
		
		CommitmentBoardVO article = sqlSession.selectOne("commitment.selectOne", num);
				
		return article;
	}

	@Override
	public CommitmentBoardVO getArticleForUpdate(int num) throws Exception {
		
		CommitmentBoardVO article = sqlSession.selectOne("commitment.selectOne", num);
		
		return article;
	}

	@Override
	public int updateArticle(CommitmentBoardVO vo) throws Exception {
		
		int check = 0;
		int num = vo.getNum();
		String name = vo.getName();
		String dbName = sqlSession.selectOne("commitment.selectName", vo);
		System.out.println(dbName);
		sqlSession.update("commitment.updateArticle", vo);
		/*if(name.equals(dbName)) {
			System.out.println(vo.getName()+"1111");
			System.out.println(vo.getParty());
			System.out.println(vo.getLocal());
			System.out.println(vo.getPhoto());
			System.out.println(vo.getUrl());
			System.out.println(vo.getNum());
			System.out.println(vo.getContent());
			sqlSession.update("commitment.updateArticle", vo);
			check = 1;
			System.out.println("수정완료");
		}else {
			check = -1;
			System.out.println("수정실패");
		}
		*/
		return check;

	}

	@Override
	public int deleteArticle(int num) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.delete("commitment.deleteArticle", num);
		
		return 0;
	}


	@Override
	public String downloadCheck(int num) throws Exception {
		
		String URL = sqlSession.selectOne("commitment.getUrl", num);
		
		return URL;
	}


}
