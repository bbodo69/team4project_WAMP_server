package member.model.vo;

import java.sql.Timestamp;

public class MemberVO {

	private String id;
	private String pw;
	private String gender;
	private String name;
	private String age;
	private String qa1;
	private String qa2;
	private String td;
	private String email;
	private Timestamp reg;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getQa1() {
		return qa1;
	}
	public void setQa1(String qa1) {
		this.qa1 = qa1;
	}
	public String getQa2() {
		return qa2;
	}
	public void setQa2(String qa2) {
		this.qa2 = qa2;
	}
	public String getTd() {
		return td;
	}
	public void setTd(String td) {
		this.td = td;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	

	
}
