package com.teulda.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.teulda.service.domain.User;


/*
 * FileName : LogonCheckInterceptor.java
 *  ㅇ Controller 호출전 interceptor 를 통해 선처리/후처리/완료처리를 수행
 *  	- preHandle() : Controller 호출전 선처리   
 * 			(true return ==> Controller 호출 / false return ==> Controller 미호출 ) 
 *  	- postHandle() : Controller 호출 후 후처리
 *    	- afterCompletion() : view 생성후 처리
 *    
 *    ==> 로그인한 회원이면 Controller 호출 : true return
 *    ==> 비 로그인한 회원이면 Controller 미 호출 : false return
 */
public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
														HttpServletResponse response, 
														Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		//==> 로그인 유무확인
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");

		//==> 로그인한 회원이라면...
		if(   user != null   )  {
			//==> 로그인 상태에서 접근 불가 URI
			String uri = request.getRequestURI();
			
			/*
			if(		uri.indexOf("addUserView") != -1 	|| 	uri.indexOf("addUser") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			*/
			
			if(		uri.indexOf("addUser") != -1 || uri.indexOf("login") != -1	|| 
					uri.indexOf("checkDuplication") != -1 ){
			
				request.getRequestDispatcher("/index.jsp").forward(request, response);
				System.out.println("[ 로그인 상태.. 로그인 후 불필요 한 요구.... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return false;
			}
			
			System.out.println("[ 로그인 상태 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return true;
		}else{ //==> 미 로그인한 화원이라면...
			//==> 로그인 시도 중.....
			String uri = request.getRequestURI();
			
			/*
			if(		uri.indexOf("addUserView") != -1 	|| 	uri.indexOf("addUser") != -1 || 
					uri.indexOf("loginView") != -1 			||	uri.indexOf("login") != -1 		|| 
					uri.indexOf("checkDuplication") != -1 ){
			*/
			
			if(		uri.indexOf("addUser") != -1 || uri.indexOf("login") != -1 	|| 
					uri.indexOf("checkDuplication") != -1 ){
				System.out.println("[ 로그 시도 상태 .... ]");
				System.out.println("[ LogonCheckInterceptor end........]\n");
				return true;
			}
			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			System.out.println("[ 로그인 이전 ... ]");
			System.out.println("[ LogonCheckInterceptor end........]\n");
			return false;
		}
	}
}//end of class