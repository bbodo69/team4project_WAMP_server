package commitment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class CommitmentDAOImple implements CommitmentDAO {
	
	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void test() throws Exception{
		
		System.out.println("2222");
		
	}
	
}
