package com.kh.inheritance;

import com.kh.inheritance.child.NoteBook;
import com.kh.inheritance.child.SmartPhone;

public class Application {

	public static void main(String[] args) {
		
		NoteBook note = new NoteBook("애플", "app-01", "맥북 프로 16", 3400000, "M3");
		
		System.out.println(note);
		
//		SmartPhone phone = new SmartPhone("삼성", "sam-02", "갤럭시 S24 울트라", 1500000, "SKT");
		
		SmartPhone phone = new SmartPhone();
		phone.setBrand("삼성");
		phone.setpCode("sam-02");
		phone.setName("갤럭시 S24 울트라");
		phone.setPrice(1500000);
		phone.setAgency("SKT");
		
	}

}
