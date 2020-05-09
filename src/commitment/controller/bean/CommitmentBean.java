package commitment.controller.bean;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import commitment.model.dao.CommitmentDAOImple;

//https://meaownworld.tistory.com/30 참고
//https://doublesprogramming.tistory.com/127 참고

@Controller
@RequestMapping("/commitment/")
public class CommitmentBean {
			
	@Autowired
	private CommitmentDAOImple commitmentDAO = null;
	
//	private static final Logger logger = LoggerFactory.getLogger(CommitmentBean.class);
	
	@RequestMapping(value = "commitmentUploadPro.do", method = RequestMethod.POST)
	public void upload(MultipartFile uploadfile) {
		
		saveFile(uploadfile);
	}

	private String saveFile(MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		
		
		// 저장할 File 객체를 생성(껍데기 파일)ㄴ
		
		File saveFile = new File("D:\\coding\\team4project\\team4\\WebContent\\resources\\img",saveName); // 저장할 폴더 이름, 저장할 파일 이름
		
		try {
			file.transferTo(saveFile);	// 업로드 파일에 saveFile 이라는 껍데기 입힘
		} catch(IOException e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}
	
	@RequestMapping("commitmentUploadForm.do")
	public String commitmentUploadForm() {
		
		return "commitment/commitmentUploadForm";
	}
	
}
	

