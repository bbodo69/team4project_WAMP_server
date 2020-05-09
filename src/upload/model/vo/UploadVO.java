package upload.model.vo;

import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class UploadVO {

	private String originalFilename;
	private String textFile;
	private MultipartFile multipartFile ;
	private long size;
	private String extName ;
	private String saveFileName ;
	private String url;
	private boolean result ;
	private FileOutputStream fos ;
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getTextFile() {
		return textFile;
	}
	public void setTextFile(String textFile) {
		this.textFile = textFile;
	}
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}
	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public String getExtName() {
		return extName;
	}
	public void setExtName(String extName) {
		this.extName = extName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isResult() {
		return result;
	}
	public void setResult(boolean result) {
		this.result = result;
	}
	public FileOutputStream getFos() {
		return fos;
	}
	public void setFos(FileOutputStream fos) {
		this.fos = fos;
	}
	
	
	
}
