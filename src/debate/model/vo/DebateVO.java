package debate.model.vo;

import java.sql.Timestamp;

public class DebateVO {

	private int num;
	private String sub;
	private String link;
	private Timestamp reg;
	private int readcount;
	private int ok;
	private int nok;
	private int ref;
	private String content;
	private String ben;
	private int re_level;
	private int re_step;	
	private String num2;
	private String writer;	
	private int check;
	private int pageNumber;
	private String sId;
	private int ref2;
	private int count;
	private int favorite;
	private int hate;
	private String regSetting;
	
	public String getRegSetting() {
		return regSetting;
	}
	public void setRegSetting(String regSetting) {
		this.regSetting = regSetting;
	}
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getRef2() {
		return ref2;
	}
	public void setRef2(int ref2) {
		this.ref2 = ref2;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public int getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getNum2() {
		return num2;
	}
	public void setNum2(String num2) {
		this.num2 = num2;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBen() {
		return ben;
	}
	public void setBen(String ben) {
		this.ben = ben;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getSub() {
		return sub;
	}
	public void setSub(String sub) {
		this.sub = sub;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getOk() {
		return ok;
	}
	public void setOk(int ok) {
		this.ok = ok;
	}
	public int getNok() {
		return nok;
	}
	public void setNok(int nok) {
		this.nok = nok;
	}
	
}
