package main.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import main.model.vo.MainVO;

public class MainDAOImple {
	
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public void login(MainVO vo, HttpSession session) throws Exception{				
				
	}
	
	public int countMaxDebateArticle() throws Exception{
		int max = 0;
		max = sqlSession.selectOne("main.countMaxDebateArticle");
		return max;
		
	}
	
	public int okMax() throws Exception{
		
		int max = 0;
		int num = countMaxDebateArticle();
		max = sqlSession.selectOne("main.okMax", num);
		return max;
	}
	
	public int NokMax() throws Exception{
		
		int max = 0;
		int num = countMaxDebateArticle();
		max = sqlSession.selectOne("main.NokMax", num);
		return max;
	}
	
	public MainVO getDebateArticle() throws Exception{
		
		MainVO vo = new MainVO();
		
		int max = countMaxDebateArticle();
		vo = sqlSession.selectOne("main.debateArticle", max);
		
		return vo;
	}
	
	public List getArticleList(int start, int end) throws Exception{
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);		
		List list = sqlSession.selectList("debate.selectAll", map);
				
		return list;
	}
	
	public List getDebateArticles() throws Exception{
		System.out.println("3333");
		List list = sqlSession.selectList("debate.getList");
		
		return list;
	}
	
	public List getIssueArticle() throws Exception{
		
		List list = sqlSession.selectList("issue.getList");
		
		return list;
	}
	
	public List getCommitmentArticle() throws Exception{
		
		List list = sqlSession.selectList("commitment.getList");
		
		return list;
	}
}
