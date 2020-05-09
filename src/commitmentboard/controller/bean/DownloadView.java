package commitmentboard.controller.bean;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
// 여기의 코드들은 확실히 저장해 놓고 그냥 써도 된다.
	public DownloadView() {
		setContentType("application/download; charset=utf-8"); 
	}
	@Override							
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
		//Map<String, Object> model : ModelAndView를 통해 보내온 인자를 웹 형태로 받음.
		
		// 파일 보낼때(download할때) 파일의 정보를 다 같이 보냄.
		File file = (File)model.get("downloadFile");		
		response.setContentType(getContentType()); 			
		response.setContentLength((int)file.length());		
		
		// 파일 이름 인코딩
		String fileName = java.net.URLEncoder.encode(file.getName(), "UTF-8"); 
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\";");  
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		OutputStream out = response.getOutputStream();		
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(file);	// 다운로드할 파일 읽기	
			FileCopyUtils.copy(fis, out);		// 밖으로 복사	
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(fis != null) { try {fis.close();}catch(Exception e2) { e2.printStackTrace(); } }
			out.flush();
		}
	
	}
	
}