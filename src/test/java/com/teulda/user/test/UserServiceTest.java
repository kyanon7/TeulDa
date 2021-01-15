package com.teulda.user.test;

import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;

//import com.teulda.common.Search;
import com.teulda.service.domain.User;
import com.teulda.service.user.UserService;

//@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",//pageSize?
																	"classpath:config/context-aspect.xml",//접점(포인트컷)
																	"classpath:config/context-mybatis.xml",//마이바티스
																	"classpath:config/context-transaction.xml" })//트랜잭션,접점(포인트컷)
//건들x
public class UserServiceTest {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Test
		public void testAddUser() throws Exception {
			
			User user = new User();
			user.setNickName("testNick");
			user.setEmail("corud1130@gmail.com");
			user.setPassword("testPasswd");
			user.setName("SCOTT");
			user.setPhone("111-2222-3333");
			user.setAddress("대한민국 서울");
			user.setLikePlace("대한민국 부산");
			user.setProfilePhoto("photoname.png");
			user.setStatus("0");
			
			userService.addUser(user);
			
			user = userService.getUser("testUserId");

			//==> console Ȯ��
			System.out.println(user);
			
			//==> API Ȯ��
			Assert.assertEquals("testNcik", user.getNickName());
			Assert.assertEquals("corud1130@gmail.com", user.getEmail());
			Assert.assertEquals("testPasswd", user.getPassword());
			Assert.assertEquals("testPasswd", user.getName());
			Assert.assertEquals("111-2222-3333", user.getPhone());
			Assert.assertEquals("testPasswd", user.getPassword());
	
			Assert.assertEquals("test@test.com", user.getEmail());
		}
	

}
