package com.kh.exception;

import java.io.IOException;

public class B_Throws {
	
	public static void main(String[] args) {
		try {
			findClass();
		} catch (ClassNotFoundException e) {
			
			System.out.println("클래스가 존재하지 않습니다.");
		}
		
		B_Throws b = new B_Throws();
		try {
			b.method1();
		} catch (ClassNotFoundException | IOException e) {
//			e.printStackTrace();
			System.out.println("예외가 발생했습니다.");
		}
	}
	
	public static void findClass() throws ClassNotFoundException {
		Class.forName("java.lang.String2");
	}
	
	public void method1() throws ClassNotFoundException, IOException {
		System.out.println("method1 호출");
		
		method2();
		
		System.out.println("method1 종료");
	}
	
	public void method2() throws ClassNotFoundException, IOException {
		System.out.println("method2 호출");
		
		method3();
		
		System.out.println("method2 종료");
	}
	
	public void method3() throws ClassNotFoundException, IOException {
		System.out.println("method3 호출");
		
		int random = (int) (Math.random() * 3 + 1);
		
		if(random==1) {
			throw new ClassNotFoundException();
		} else if(random==2){
			throw new IOException();
			
		}
		System.out.println("method3 종료");
	}
}
