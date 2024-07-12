package com.kh.lambda;

/*
  람다식(Lambda Expressions) => 자바스크립트의 화살표 함수
  - 자바에서 함수적 프로그래밍을 위해서 자바 8부터 람다식을 지원
  - 람다식은 매개변수를 가지는 함수와 같은 코드 블록이지만
    런타임 시에는 인터페이스의 익명 구현 객체를 생성한다.
  - 람다식을 사용하면 코드가 간결해지고, 컬렉션 요쇼돌을 필터링하거나 매핑해서
    원하는 결과를 쉽게 가져올수 있다.
 */

public class Application {
	
	public static void main(String[] args) {
		
		int a = 10;
		int b = 3;
		
		Application ap = new Application();
		System.out.println(ap.plus(a, b));
		System.out.println(ap.minus(a, b));
		System.out.println(ap.mulitly(a, b));
		System.out.println(ap.divide(a, b));
		System.out.println(ap.left(a, b));
		
		System.out.println();
		
		// 람다식으로 바꿔보기
//		MathInterface plusLambda = (int x, int y) -> {
//			return x + y;
//		};
		
		MathInterface plus = (int x, int y) -> x + y;
		
		MathInterface minus = (int x, int y) -> x - y;
		
		MathInterface multi = (int x, int y) -> x * y;
		
		MathInterface divide = (int x, int y) -> x / y;
		
		MathInterface left = (int x, int y) -> x % y;
		
		System.out.println(plus.calc(a, b));
		System.out.println(minus.calc(a, b));
		System.out.println(multi.calc(a, b));
		System.out.println(divide.calc(a, b));
		System.out.println(left.calc(a, b));
	}
	
	public int plus(int a, int b) {
		return a + b;
	}
	
	public int minus(int a, int b) {
		return a - b;
	}
	
	public int mulitly(int a, int b) {
		return a * b;
	}
	
	public int divide(int a, int b) {
		return a / b;
	}
	
	public int left(int a, int b) {
		return a % b;
	}
	
}
