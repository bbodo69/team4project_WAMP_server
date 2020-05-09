package issue.model.vo;

import java.sql.Timestamp;

public class IssueVO {
	private int num;
	private String link;
	private String content;
	private int tda;
	private int tdb;
	private int tdc;
	private String pre;
	private Timestamp reg;
	private int readcount;
	private int ref;
	private String ben;
	private int re_level;
	private int re_step;
	private int td;
	private String writer;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getTd() {
		return td;
	}
	public void setTd(int td) {
		this.td = td;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getTda() {
		return tda;
	}
	public void setTda(int tda) {
		this.tda = tda;
	}
	public int getTdb() {
		return tdb;
	}
	public void setTdb(int tdb) {
		this.tdb = tdb;
	}
	public int getTdc() {
		return tdc;
	}
	public void setTdc(int tdc) {
		this.tdc = tdc;
	}
	public String getPre() {
		return pre;
	}
	public void setPre(String pre) {
		this.pre = pre;
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
}
