package com.kh.time;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class A_Date {
	
	/*
	  Date
	  - java.util 패키지에 속한 날짜와 시간을 다룰 목적으로 만들어진 클래스 (JDK 1.0)
	  - Date의 메서드는 대부분 deprecated(비권장) 되어있지만 여전히 사용 
	 */
	public void method1() {
		// 기본 생성자로 객체를 생성하면 현재 시스템의 시간에 대한 정보를 가지고 객체 생성
		Date today = new Date();
		System.out.println(today);
		
		Date when = new Date(0);
		System.out.println(when);
		
		System.out.println("getTime : " + today.getTime());
		
		// SimpleDateFormat : 날짜 데이터를 원하는 형태로 출력할 수 있도록
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY년 MM월 dd일 (E) HH시 mm분 ss초");
		String formatDate = sdf.format(today);
		//2024년 7월 11일 (목) 12시 8분 30초
		System.out.println(formatDate);
		
	}
	
	/*
	  Calendar
	  - Date 클래스를 개선한 추상 클래스 (JDK 1.1)
	  - 여전히 단점이 존재
	 */
	public void method2() {
		/*
		  추상 클래스이기 때문에 직접 객체 생성할 수 없다
		  getInstance() 메서드로 Calendar 클래스를 구현한 클래스의 객체를 반환
		  태국 - BuddhistCalender, 그 외 - GregorianCalendar
		 */
		Calendar today = Calendar.getInstance();
		today = new GregorianCalendar();
		System.out.println(today);
		
		// 년, 월, 일, 시, 분, 초
		System.out.println("YEAR : " + today.get(Calendar.YEAR) + "년");
		System.out.println("MONTH : " + (today.get(Calendar.MONTH)+1) + "월");
		System.out.println("DATE : " + today.get(Calendar.DATE) + "일");
		System.out.println("HOUR : " + today.get(Calendar.HOUR) + "시");
		System.out.println("HOUR_OF_DAY : " + today.get(Calendar.HOUR_OF_DAY));
		System.out.println("MINUTE : " + today.get(Calendar.MINUTE) + "분");
		System.out.println("SECOND : " + today.get(Calendar.SECOND) + "초");
		
		System.out.println();
		
		// 날짜 지정
		
	}
	
	public static void main(String[] args) {
		A_Date a = new A_Date();
//		a.method1();
		a.method2();
	}
	
}
