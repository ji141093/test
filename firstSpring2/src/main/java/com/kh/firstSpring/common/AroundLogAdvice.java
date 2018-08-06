package com.kh.firstSpring.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service
@Aspect
public class AroundLogAdvice {
	
	@Pointcut("execution(* com.kh.firstSpring..*Service.*(..))")
	public void getAllPointCut(){}
	/*
	@Around("getAllPointCut()")
	public Object printLog(ProceedingJoinPoint jp){
		
		String name = jp.getSignature().getName(); // 호출된 메소드 이름

		StopWatch sw = new StopWatch();
		sw.start();
		Object obj = null;
		try {
			obj = jp.proceed();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		sw.stop();
		
		System.out.println(name + "() 메소드 실행, 소요 시간 : " + sw.getTotalTimeMillis() + "(ms)초");
		
		return obj;
	}*/
}
