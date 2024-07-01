package com.kh.condition;

import java.util.Scanner;

public class A_If {
	
	Scanner sc = new Scanner(System.in);
	
	/*
	  if문
	  
	  if(조건식) {
	 	조건식이 참(true)일 때 실행
	  }
	  
	  - 보통 조건식에는 비교연산자, 논리연산자를 주로 사용
	 */
	
	public void method1() {
		
		// 입력받은 성적이 60점 이상이면 "합격입니다"를 출력
		System.out.print("성적 입력 : ");
		int grade = sc.nextInt();
		if (grade >= 60) {
			System.out.println("합격입니다");
			System.out.println("축하합니다");
		}
		// 한줄만 들어갔을 때 유용!
		if(grade >= 60) System.out.println("합격입니다");
	}
	
	/*
	  if-else문
	  
	  if(조건식) {
	  	 조건식이 참(true)일 때 실행
	  } else {
	    조건식이 거짓(false)일 때 실행
	  }
	  */
	
	public void method2() {
		//입력받은 성적이 60점 이상이면 "합격입니다",
		//아니면 "불합격입니다" 를 출력
		
		System.out.print("성적 입력 : ");
		int grade = sc.nextInt();
		if (grade >= 60) {
			System.out.println("합격입니다");
			System.out.println("축하합니다");
		} else {
			System.out.println("불합격입니다");
			System.out.println("다시 도전해봅시다");
			}
		
		//삼항연산자
		String result = grade >= 60 ? "합격입니다" : "불합격입니다";
		System.out.println(result);
	}
	
	public void method3() {
		//본인의 이름을 입력했을 때 본인이면 "본인이다", 아니면 "본인이 아니다"를 출력
		System.out.print("이름 입력 : ");
		String name = sc.nextLine();
		
		System.out.println("name의 주소값 : " + System.identityHashCode(name));
		System.out.println("본인이름의 주소값 : " + System.identityHashCode("장영태"));
		
		if (name.equals("장영태")) {
			System.out.println("본인입니다.");
		} else {
			System.out.println("본인이 아닙니다");
		}
	}
	
	/*
	  if - else if - else문
	  
	  if(조건식1) {
	     조건식1이 참(true)일 때 실행
	  } else if (조건식2) {
	    조건식1이 거짓(false)이면서 조건식2이 참(true)일 때 실행
	  } else {
	    조건식1, 조건식2 모두 거짓(false)일 때 실행
	  }
	  
	  - else if는 수가 제한이 없다
	  */
	public void method4() {
		
		//입력받은 숫자가 0보다 크면 "양수", 0이면 "0이다", 작으면 "음수" 출력
		System.out.print("숫자 입력 : ");
		int num = sc.nextInt();
		
		if (num > 0) {
			System.out.println("양수");
		} else if (num == 0) {
			System.out.println("0입니다");
		} else {
			System.out.println("음수입니다");
		}
		
		if (num > 0) {
			System.out.println("양수");
		} else {
			if(num == 0) { // if문 중첩가능, 추천하는 방법은 아님
				System.out.println("0이다");
			} else {
				System.out.println("음수");
			}
		}
		
		//삼향연산자
		String result = num > 0 ? "양수" : num == 0 ? "0이다" : "음수";
		System.out.println(result);
		
	}
	/*
	  사용자에게 점수(0~100)를 입력받아서 점수별로 등급 출력
	  -90점 이상은 A 등급
	  -90점 미만 80점 이상은 B등급
	  -80점 미만 70점 이상은 C등급
	  -70점 미만 60점 이상은 D등급
	  -60점 미만 F 등급
	 */
	
	public void practice1() {
		System.out.print("점수 입력 : ");
		int score = sc.nextInt();
		
		if (score >= 90) {
			System.out.println("A등급");
		} else if (score < 90 && score >= 80) {
			System.out.println("B등급");
		} else if (score < 80 && score >= 70) {
			System.out.println("C등급");
		} else if (score < 70 && score >= 60) {
			System.out.println("D등급");
		} else {System.out.println("F등급");}
		
		String result = "";
		
		if (score >= 90) {
			result = "A";
		} else if (score < 90 && score >= 80) {
			result = "B";
		} else if (score < 80 && score >= 70) {
			result = "C";
		} else if (score < 70 && score >= 60) {
			result = "D";
		} else { result = "F";}
		
		System.out.println(result);
	}
	
	/*
	   세 정수를 입력했을 때 짝수만 출력
	   
	   num1 입력 : 3
	   num2 입력 : 4
	   num3 입력 : 6
	   
	 */
	public void practice2() {
		
		System.out.print("num1 입력 : ");
		int num1 = sc.nextInt();
		System.out.print("num2 입력 : ");
		int num2 = sc.nextInt();
		System.out.print("num3 입력 : ");
		int num3 = sc.nextInt();
		
		if (num1 % 2 == 0) {
			System.out.println(num1);
		} if (num2 % 2 ==0) {
			System.out.println(num2);
		} if (num3 % 2 ==0) {
			System.out.println(num3);
		}
	}
	
	/*
	  정수 1개를 입력했을 때 음(minus)/양(plus)/0(zero), 짝(even)/홀(odd) 출력
	  
	  정수 입력 : -3
	  minus
	  odd
	 */
	public void practice3() {
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		if (num <= 0) {
			System.out.println("minus");
		} else if (num == 0) {
			System.out.println("zero");
		} else {
			System.out.println("plus");
		}
		
		if (num %2 == 0) {
			System.out.println("even");
		} else {
			System.out.println("odd");
		}
	}
	
	
	public static void main(String[] args) {
		A_If a = new A_If();
//		a.method1();
//		a.method2();
//		a.method3();
//		a.method4();
//		a.practice1();
//		a.practice2();
		a.practice3();
	}

}
