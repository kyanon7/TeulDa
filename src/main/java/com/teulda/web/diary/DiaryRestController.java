package com.teulda.web.diary;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.teulda.common.Group;
import com.teulda.service.diary.DiaryService;
import com.teulda.service.domain.Diary;
import com.teulda.service.domain.User;

//==> 기록관리 RestController
@RestController
@RequestMapping("/diary/*")

public class DiaryRestController {

	/// Field
	@Autowired
	@Qualifier("diaryServiceImpl")
	private DiaryService diaryService;
	
	// 파일 업로드 경로
	@Value("#{commonProperties['zoo1Path']}") 
	String uploadPath;
	
	public DiaryRestController() {
		System.out.println(this.getClass()); // 디버깅 위함
	}
	
	// addDiary.jsp 에서 SummerNote 파일업로드 할 때 사용 
	@RequestMapping(value="rest/uploadSummernoteImageFile", produces = "application/json")
	public JSONObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) throws Exception {
		
		JSONObject jsonObject = new JSONObject();
		
		String fileRoot = uploadPath; // 저장될 (외부) 파일 경로
		
		String originalFileName = multipartFile.getOriginalFilename();	// 원본 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	// 저장될 파일 명 (랜덤아이디 부여) 
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	// 파일 저장
			jsonObject.put("url", "/summernoteImage/"+savedFileName);
			jsonObject.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	// 저장된 파일 삭제
			jsonObject.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	// updateDiary.jsp 에서 해시태그 삭제 할 때 사용 
	@RequestMapping(value="rest/deleteHashTag", produces = "application/json")
	public String deleteHashTag(@RequestParam("hashTagNo") int hashTagNo) throws Exception {
		
		diaryService.deleteHashTag(hashTagNo);
		
		return "Success";
	}
	
	// getMyDiaryMap.jsp 에서 기록 리스트 (위도, 경도, 위치, 제목, 등등..) 와 기록 총 갯수 받아오기 
	@RequestMapping(value="rest/getDiaryList", produces = "application/json")
	public JSONObject getDiaryList(HttpSession session) throws Exception {
		
		User user = (User) session.getAttribute("user");
		String nickname = user.getNickname();
		
		Map<String, Object> map = diaryService.getMyDiaryList(nickname);
		
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("diaryList", map.get("diaryList"));
		jsonObject.put("totalCount", ((Integer)map.get("totalCount")).intValue());


		return jsonObject;
	}
	
	// listDiary.jsp 에서 기록 그룹 생성 
	@RequestMapping(value="rest/addDiaryGroup", produces = "application/json")
	public String addDiaryGroup(@RequestParam("groupName") String groupName, HttpSession session) throws Exception {
		
		Group group = new Group();
		group.setGroupName(groupName);
		group.setNickname(((User) session.getAttribute("user")).getNickname());
		
		diaryService.addDiaryGroup(group);
		
		return "Success";
	}
}
