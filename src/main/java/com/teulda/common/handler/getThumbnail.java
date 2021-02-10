package com.teulda.common.handler;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

// 참고 블로그 : https://serenastory.tistory.com/75 & https://joont.tistory.com/56
public class getThumbnail {
	
	public static String getImgSrc(String str) {
		
		// 이미지 태그를 추출하기 위한 정규식.
		Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		 
		// 내용 중에서 이미지 태그를 찾아라!
		Matcher match = pattern.matcher(str);
		 
		String imgTag = null;
		 
		if (match.find()) { // 이미지 태그를 찾았다면,,
		    imgTag = match.group(1); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
		    // 여기서 while 문을 돌았다면 이미지 태그 안의 파일명이 다 뽑혀져 올 것임 ! 
		    // if 문이기 때문에 걍 맨 처음꺼 하나만 뽑히는듯 
		}
		 
		// 결과값은 name1.jpg
		System.out.println("imgTag : " + imgTag);
		
		return imgTag;
	}
}

