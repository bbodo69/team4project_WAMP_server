package upload.model.dao;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface UploadDAO {
	
	public String restore(MultipartFile multipartFile);
	
}
