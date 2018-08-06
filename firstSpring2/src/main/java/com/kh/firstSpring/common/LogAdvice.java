package com.kh.firstSpring.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice {
	Logger log = LoggerFactory.getLogger(LogAdvice.class);
	
	@Pointcut("execution(* com.kh.firstSpring..*Service.*(..))")
	public void getAllPointCut(){}
	
	@Before("getAllPointCut()")
	public void printLog(JoinPoint jp){
		
		String name = jp.getSignature().getName(); // 호출된 메소드 이름
		Object[] params = jp.getArgs();

//		System.out.println(name + "() 메소드 실행, 파라미터 개수 : " + params.length);
		// logger 이용해서 출력
		log.info(name + "() 메소드 실행, 파라미터 개수 : " + params.length);
		
		for(Object param : params){
			System.out.println("매개변수 : " + param/*.toString()*/);
		}
		
	}
}
