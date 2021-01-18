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
import org.springframework.test.context.web.WebAppConfiguration;


import com.teulda.common.Search;
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
	
	//유저등록
		@Test
		public void testAddUser() throws Exception {
			
			System.out.println("debug");
		
			User user = new User();
			user.setNickName("testNick");
			user.setEmail("corud1130@gmail.com");
			user.setPassword("testPasswd");
			user.setName("SCOTT");
			user.setPhone("111-2222-3333");
			user.setBirth("2000-01-01");
			user.setAddress("대한민국 서울");
			user.setLikePlace("대한민국 부산");
			user.setProfilePhoto("username.png");
			user.setStatus('0');
			user.setStatusDate(null);
			user.setIsPublic('t');
			user.setRole('0');
			
			System.out.println(user);
			userService.addUser(user);
			
			user = userService.getUser("testNick");

			System.out.println(user);

			Assert.assertEquals("testNick", user.getNickName());
			Assert.assertEquals("corud1130@gmail.com", user.getEmail());
			Assert.assertEquals("testPasswd", user.getPassword());
			Assert.assertEquals("SCOTT", user.getName());
			Assert.assertEquals("111-2222-3333", user.getPhone());
			Assert.assertEquals("2000-01-01", user.getBirth());
			Assert.assertEquals("대한민국 서울", user.getAddress());
			Assert.assertEquals("대한민국 부산", user.getLikePlace());

		}
		//완
		
		//@Test
		public void testGetUser() throws Exception{
			
			System.out.println("debug");
			
			User user = userService.getUser("testNick");
			
			System.out.println("debug");
			System.out.println(user);//확인
			System.out.println("debug");
			
			Assert.assertEquals("testNick", user.getNickName());
			Assert.assertEquals("corud1130@gmail.com", user.getEmail());
			Assert.assertEquals("testPasswd", user.getPassword());
			Assert.assertEquals("SCOTT", user.getName());
			Assert.assertEquals("111-2222-3333", user.getPhone());
			//Assert.assertEquals("2000-01-01", user.getBirth());
			Assert.assertEquals("대한민국 서울", user.getAddress());
			Assert.assertEquals("대한민국 부산", user.getLikePlace());

		}
		//완

		//@Test
		public void testDeleteUser() throws Exception{
			
			System.out.println("debug");
			User user = userService.getUser("testNick");
			userService.deleteUser("testNick");
			Assert.assertNotNull(user);
			System.out.println(user);
			
		}
		//완
		
		//@Test
				public void testUpdateUser() throws Exception{
					
					System.out.println("debug");
					
					User user = userService.getUser("testNick");
					
					System.out.println("debug");
					System.out.println(user);//확인
					System.out.println("debug");
					
					user.setNickName("change2");
					//user.setPhone("777-7777-7777");
					//user.setEmail("change@change.com");
					
					userService.updateUser(user);
					
					user = userService.getUser("change");
			
				}
		
}
