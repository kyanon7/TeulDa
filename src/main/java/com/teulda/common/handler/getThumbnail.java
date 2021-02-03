package com.teulda.common.handler;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

// 참고 블로그 : https://serenastory.tistory.com/75
public class getThumbnail {
	
	public static String getImgSrc(String str) {
		
		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		 
		// 내용 중에서 이미지 태그를 찾아라!
		Matcher match = pattern.matcher(str);
		 
		String imgTag = null;
		 
		if (match.find()) { // 이미지 태그를 찾았다면,,
		    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
		}
		 
		// 결과값은 name1.jpg
		System.out.println("imgTag : " + imgTag);
		
		return imgTag;
	}
}

