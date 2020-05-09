package main.model.dao;

import java.util.List;

import main.model.vo.MainVO;

public interface MainDAO {

	public List getDebateArticle() throws Exception;
	
	public void login(String id, String pw) throws Exception;
	
	public List getIssueArticle() throws Exception;
	
	public List getDebateArticles() throws Exception;
	
}
