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
import com.teulda.service.domain.Report;
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
			user.setNickname("testUser3");
			user.setEmail("corud1130");
			user.setPassword("testPasswd");
			user.setName("SCOTT");
			user.setPhone("110-2222-3345");
			user.setBirth("2000-01-01");
			user.setAddress("대한민국 서울");
			user.setLikePlace("대한민국 부산");
			user.setProfilePhoto("username.png");
			//user.setStatus('0');
			user.setStatusDate(null);
			user.setIsPublic('t');
			user.setRole('1');
			
			System.out.println(user);
			userService.addUser(user);
			
			user = userService.getUser("testUser3");

			System.out.println(user);

			Assert.assertEquals("testUser3", user.getNickname());
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
			
			Assert.assertEquals("testNick", user.getNickname());
			Assert.assertEquals("change@change.com", user.getEmail());
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
			
			System.out.println("유저삭제 디버깅");
			User user = userService.getUser("testNick");
			userService.deleteUser("testNick");
			Assert.assertNotNull(user);
			System.out.println(user);
			
		}
		//완
		
				//@Test
				public void testUpdateUser() throws Exception{
					
					User user = new User();
					
					user = userService.getUser("testNick");
					
					System.out.println(user);//확인
				
					user.setNickname("testNick");
					user.setPhone("777-7777-7777");
					user.setEmail("change@change.com");
					user.setPassword("testPasswd");
					user.setName("SCOTT");
					user.setBirth("2000-01-01");
					user.setAddress("대한민국 서울");
					user.setLikePlace("대한민국 부산");
					user.setProfilePhoto("username.png");
					//user.setStatus('0');
					user.setStatusDate(null);
					user.setIsPublic('t');
					user.setRole('0');
					
					userService.updateUser(user);
					
					System.out.println("debug");
					
					User change = userService.getUser("testNick");
					System.out.println(change);//확인
					
					System.out.println("debug");
			
				}
				//완
		
				//@Test
				 public void testGetUserList() throws Exception{
				 
					 System.out.println("유저리스트 디버깅");
					 
					 Search search = new Search();
					 search.setCurrentPage(1);
					 search.setPageSize(3);
					 Map<String, Object> map = userService.getUserList(search); 
					 List<Object> list= (List<Object>)map.get("list");
					 
					 Integer totalCount = (Integer)map.get("totalCount");
					 
					 System.out.println(list);//확인
					 System.out.println(totalCount);//확인
					 
					  }
				 //대략완
				//신고등록
					//@Test
					public void testAddReport() throws Exception {
						
						System.out.println("debug");
					
						Report report = new Report();
						
						report.setReportNo(10001);
						report.setReportDate(null);
						report.setReason("테스트테스트");
						report.setReportPhoto(null);
						report.setReporterNick("king성영");
						report.setTargetNick("king제현");
						report.setReportType("욕설");
						
						userService.addReport(report);		

						System.out.println(report);

					}
					
					//@Test
					public void testDeleteReport() throws Exception {
						
						System.out.println("debug");
					
						Report report = new Report();
						
						report.setReportNo(10001);
						report.setReportDate(null);
						report.setReason("테스트테스트");
						report.setReportPhoto(null);
						report.setReporterNick("king성영");
						report.setTargetNick("king제현");
						report.setReportType("욕설");
						
						userService.addReport(report);		

						System.out.println(report);

					}
				 
				
}
