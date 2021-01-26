package com.teulda.web.diary;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;

//==> 기록관리 RestController
@RestController
@RequestMapping("/diary/*")

public class DiaryRestController {

	/// Field
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	public DiaryRestController() {
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
//	@RequestMapping(value="rest/addDiary", method=RequestMethod.POST)
//	public ModelAndView addDiary(@RequestBody Diary diary) throws Exception {
//		
//		System.out.println("/diary/rest/addDiary : POST");
//		
//		// Model 과 View 연결
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("diary", diary);
//		modelAndView.setViewName("/diary/addDiary.jsp");
//		
//		return modelAndView;
//	}
	
	@RequestMapping(value="rest/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JSONObject jsonObject = new JSONObject();
		
		//String fileRoot = "\\TeulDa\\WebContent\\resources\\images\\summernote_uploadFiles\\";	//저장될 (외부) 파일 경로
		String fileRoot = "/Users/jungjoowon/git/TeulDa/WebContent/resources/images/summernote_uploadFiles/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	// 저장될 파일 명 (랜덤아이디 부여) 
		
		File targetFile = new File(fileRoot + savedFileName);	
		
//		HashMap<String, Object> hashMap = new HashMap<String, Object>();
//		hashMap.put("url", "/resources/images/summernote_uploadFiles"+savedFileName);
//		hashMap.put("responseCode", "success");
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.put("url", "/resources/images/summernote_uploadFiles/"+savedFileName);
			jsonObject.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
}
