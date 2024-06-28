package com.kh.operator;

import java.util.Scanner;

public class F_Triple {
	
	Scanner sc = new Scanner(System.in);
	
	/*
	   삼항 연산자
	  
	   조건식 ? 값1 : 값2;
	  
	   - 조건식에는 주로 비교, 논리 연산자가 사용된다.
	   - 조건식의 결과가 true이면 값1을 반환한다.
	   - 조건식의 결과가 false이면 값2를 반환한다.
	 */

	public static void main(String[] args) {
		F_Triple f = new F_Triple();
//		f.method1();
//		f.practice1();
//		f.practice2();
 	    f.practice3();
	}
	public void method1() {
		// 입력받은 정수가 양수인지 음수인지 판단
		System.out.print("정수값 >> ");
		int number = sc.nextInt();
		
		String result = number > 0 ? "양수" : "음수";
		
		
	System.out.println(result);
		
		// 0이다 포함
	
	String result1 = number == 0 ? "0입니다" : number > 0 ? "양수" : "음수";
	}
	
	/*
	  실습문제 1
	  사용자한테 두 개의 정수값을 입력받아서 두 정수의 곱셈 결과 100보다 크거나 같은 경우
	  "결과가 100 이상입니다." 아닌 경우 "결과가 100 보다 작습니다." 출력
	 */
	public void practice1() {
		System.out.print("1번 정수 입력 = ");
		int NO1 = sc.nextInt();
		
		System.out.print("2번 정수 입력 = ");
		int NO2 = sc.nextInt();
		
		int mathmatic = NO1 * NO2;
		
		String result = mathmatic >= 100 ? "결과가 100 이상입니다." 
				:"결과가 100 보다 작습니다.";
		
		System.out.println(result);
	}
	
	/*
	  실습문제 2
	  사용자한테 문자를 하나 입력받아서 입력한 문자가 대문자이면
	  "알파벳 대문자이다." 아닌 경우 "알파벳 대문자가 아니다." 출력 
	 */
	
	public void practice2() {
		System.out.print("문자 입력 >");
		char alphbt = sc.nextLine().charAt(0);
		
		String result = 'A' <= alphbt && alphbt <= 'Z' ? "알파벳 대문자이다." : "알파벳 대문자가 아니다.";
		
		System.out.println(result);
	}
	
	/*
	  실습문제3
	  두 정수를 입력받고 + 또는 -를 입력받아서 계산을 출력
	  단, + 또는 - 이외의 문자를 입력하는 경우 "잘못 입력했습니다." 출력
	  
	  예시)
	  첫번째 수 > 3
	  두번째 수 > 4
	  
	  연산자 입력(+ 또는 -) > +
	  3 + 4 = 7
	  
	  연산자 입력(+ 또는 -) > -
	  3 - 4 = -1
	  
	  연산자 입력(+ 또는 -) > *
	  잘못 입력했습니다.
	  */
	public void practice3() {
		System.out.print("첫번째 수 입력 >");
		int first = Integer.parseInt(sc.nextLine());
		
		System.out.print("두번째 수 입력 >");
		int second = Integer.parseInt(sc.nextLine());
		
//		sc.nextLine();
		
		System.out.print("+ 또는 - 입력 >");
		char math = sc.nextLine().charAt(0);
		
		String result =
				math == '+' 
				? first + "+" + second + "=" + (first + second)
						: math == '-'
						? first + "-" + second + "=" + (first - second)
								: "잘못 입력했습니다.";
		
//		System.out.println(result);
		
		
		// 또 다른 방법 1 : 조건문 사용 (5주 1일차 학습예정)
	/*	if(math=='+' || math=='-') {
			System.out.printf
			("%d %c %d = %d", first, math, second, math=='+'? (first+second) : (first-second));
		} else {
			System.out.println("잘못 입력 했습니다.");
		} */
		// 또 다른 방법 2 : 
		result = math == '+' 
				? String.format("%d + %d = %d", first, second, (first + second))
						: math == '-'
						? String.format("%d - %d = %d", first, second, (first- second))
								: "잘못 입력했습니다.";
		System.out.println(result);
		
	}
}
