package com.teulda.common.aspect;

import org.aspectj.lang.ProceedingJoinPoint;

/*
 * FileName : PojoAspectJ.java
 *	:: XML 에 선언적으로 aspect 의 적용   
  */
public class LogAspectJ {

	///Constructor
	public LogAspectJ() {
		System.out.println("\nCommon :: "+this.getClass()+"\n");
	}
	
	//Around  Advice
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
			
		System.out.println("");
		System.out.println("[Around before] 타겟 메소드:"+
							joinPoint.getTarget().getClass().getName() +"."+
							joinPoint.getSignature().getName());
		
		if(joinPoint.getArgs().length !=0){
			System.out.println("[Around before] 메소드에 전달되는 인자 : "+ joinPoint.getArgs()[0]);
		}
		//==> 타겟 객체의 Method 를 호출 하는 부분 
		Object obj = joinPoint.proceed();

		System.out.println("[Around after] 타겟 객체 return value: "+obj);
		System.out.println("");
		
		return obj;
	}
	
}//end of class