package commitmentboard.model.vo;

import org.springframework.web.multipart.MultipartFile;

public class CommitmentBoardVO {

	private int num;
	private String name;
	private String party;
	private String local;
	private String content;
	private String url;
	private String photo;
	private MultipartFile uploadFile;
	private MultipartFile uploadPdf;
	
	
	public MultipartFile getUploadPdf() {
		return uploadPdf;
	}
	public void setUploadPdf(MultipartFile uploadPdf) {
		this.uploadPdf = uploadPdf;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}
