package com.kh.time;

import java.time.DateTimeException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Period;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Scanner;

public class B_Time {
	
	public void method1() {
		
		LocalDateTime now = LocalDateTime.now();
		System.out.println("today : " + now);
		
		//날짜 지정
		LocalDateTime when = LocalDateTime.of(2024, 7, 11, 17, 50, 0);
		System.out.println(when);
		
		// ZonedDateTime : LocalDateTime + 시간대
		System.out.println("ZonedDateTime : " + ZonedDateTime.now());
		
		// 년, 월, 일, 요일, 시, 분, 초
		System.out.println(now.getYear()+ "년");
		System.out.println(now.getMonth());
		System.out.println(now.getMonthValue() + "월");
		System.out.println(now.getDayOfMonth() + "일");
		System.out.println(now.getDayOfWeek()); //THURSDAY
		System.out.println(now.getHour()+ "시");
		System.out.println(now.getMinute()+ "분");
		System.out.println(now.getSecond()+ "초");
		
		System.out.println();
		
		//날짜 조작
		LocalDateTime plusDays = now.plusDays(1).plusMonths(2).plusYears(1);
		System.out.println("plus : " + plusDays);
		
		LocalDateTime minusDays = now.minusYears(1).minusMonths(1).minusDays(1);
		System.out.println("minus : " + minusDays);
		
		LocalDateTime withDays = now.withYear(2025).withMonth(8).withDayOfMonth(10);
		System.out.println("with : " + withDays);
		
		System.out.println("isAfter : " + now.isAfter(withDays)); // 오늘이 해당 날짜보다 이후인가?
		System.out.println("isBefore : "+ now.isBefore(withDays)); // 오늘이 해당 날짜보다 이전인가?
		
		// LocalDate : 날짜 정보를 저장
		LocalDate localDate = LocalDate.now();
		System.out.println("LocalDate : " + localDate);
		localDate = LocalDate.of(2024, 11, 13);
		System.out.println("LocalDate 2 : " + localDate);
		
		// LocalTime : 시간 정보만 저장
		LocalTime localTime = LocalTime.now();
		System.out.println("LocalTime : " + localTime);
		localTime = LocalTime.of(17, 49, 59);
		System.out.println("LocalTime2 : " + localTime);
	}
	
	/*
	  Period와 Duration
	  - 날짜와 시간 간격을 표현하기 위한 클래스
	  - Period : 두 날짜 간의 차이
	  - Duration : 시간의 차이 
	 */
	public void method2() {
		
		LocalDate date1 = LocalDate.of(2024, 1, 1);
		LocalDate date2 = LocalDate.of(2025, 12, 31);
		
		Period pe = Period.between(date1, date2);
		System.out.println("pe : " + pe);
		
		System.out.println("years : " + pe.getYears());
		System.out.println("months : " + pe.getMonths());
		System.out.println("days : " + pe.getDays());
		
		System.out.println("years : " + pe.get(ChronoUnit.YEARS));
		System.out.println("months : " + pe.get(ChronoUnit.MONTHS));
		System.out.println("days : " + pe.get(ChronoUnit.DAYS));
		
		LocalTime time1 = LocalTime.of(0, 0, 0);
		LocalTime time2 = LocalTime.of(11, 59, 59);
		
		Duration du = Duration.between(time1, time2);
		System.out.println(du);
		
		System.out.println("hours : " + du.toHours());
		System.out.println("minutes : " + du.toMinutes());
		System.out.println("seconds : " + du.toSeconds());
		
		// 문자열을 LocalDate 객체로 파싱
		LocalDate date = LocalDate.parse("2024-11-13");
		System.out.println(date);
		
		//DateTimeFormatter
		// 날짜와 시간을 포맷팅(Formatting)된 문자열로 변환하는 메서드를 제공하는 클래스
		LocalDateTime today = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
		String formatDate = today.format(dtf);
		System.out.println(formatDate);
	}
	
	/*
	  D-Day 계산기 : 년월일을 입력하여 디데이 계산
	  ChronoUnit.DAYS.between(날짜, 날짜)
	  또는 날짜.until(날짜, ChronoUnit.DAYS)
	 */
	public void method3() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("D-Day 계산기");
		System.out.println("년월일을 입력하여 디데이 계산");
		System.out.print("년 : ");
		int year = Integer.parseInt(sc.nextLine());
		System.out.print("월 : ");
		int month = Integer.parseInt(sc.nextLine());
		System.out.print("일 : ");
		int day = Integer.parseInt(sc.nextLine());
		
		try {
			LocalDate date = LocalDate.of(year, month, day);
			System.out.println(date);
			
			LocalDate today = LocalDate.now();
			long dDay = today.until(date, ChronoUnit.DAYS);
			dDay = ChronoUnit.DAYS.between(date, today);
			if(dDay == 0) {
				System.out.println("D-Day");
			} else if (dDay < 0) {
				System.out.println("D-Day까지 남은 기간은 D" + dDay + "일");
			} else {
				System.out.println("D-Day로 부터 지난 기간은 D+" + dDay + "일");
			}
			
			} catch(DateTimeException e){
				System.out.println("잘못 입력했습니다. 다시 입력해주세요.");
				method3();
			}
		
		
	}
	
	
	public static void main(String[] args) {
		
		B_Time b = new B_Time();
//		b.method1();
//		b.method2();
		b.method3();

	}
}
