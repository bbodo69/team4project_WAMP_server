package upload.model.dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import debate.model.dao.DebateDAO;

@Service
public class UploadDAOImple implements UploadDAO{

	private SqlSessionTemplate sqlSession = null;
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	private static final String SAVE_PATH = "C:\\Users\\pc\\git\\repository2\\team4\\WebContent\\resources\\file";
	private static final String PREFIX_URL = "C:\\Users\\pc\\git\\repository2\\team4\\WebContent\\resources\\file\\";
	
	public String restore(MultipartFile multipartFile) {
		String url = null;
		System.out.println(multipartFile + " = multipartFile");
		try {
			// 파일정보
			String originalFilename = multipartFile.getOriginalFilename();
			String extName = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
			long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);
			System.out.println("originFilename : " + originalFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + saveFileName;
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return url;
		
	}
	
	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	// 파일을 실제로 write 하는 메서드
	private boolean writeFile(MultipartFile multipartFile, String saveFileName) throws IOException{
		
		boolean result = false;
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return result;
		
	}
	
}