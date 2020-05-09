package main.model.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class MainVO {

	private String id;
	private String pw;
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
	private int tda;
	private int tdb;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParty() {
		return party;
	}
	public void setParty(String party) {
		this.party = party;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public MultipartFile getUploadPdf() {
		return uploadPdf;
	}
	public void setUploadPdf(MultipartFile uploadPdf) {
		this.uploadPdf = uploadPdf;
	}
	private int tdc;
	private String pre;
	private int td;
	private String name;
	private String party;
	private String local;
	private String url;
	private String photo;
	private MultipartFile uploadFile;
	private MultipartFile uploadPdf;
	
	
	
	
	
	
	
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
	public int getTd() {
		return td;
	}
	public void setTd(int td) {
		this.td = td;
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
		
}
