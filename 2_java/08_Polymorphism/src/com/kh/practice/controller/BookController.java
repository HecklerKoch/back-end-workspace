package com.kh.practice.controller;

import java.awt.print.Book;

import com.kh.practice.model.Member;

public class BookController {
	
	private Member member = new Member();
	
	
	// 내 정보 추가
	
	public void addMember(String name, int age) {
		member.setName(name);
		member.setAge(age);
	}
	
	// 마이페이지
	public Member myPage() {
		return member;
		
	// 책 대여
		public String rentBook(book book) {
			Book[] bookList = member.getBooklist();
			for (Book value : bookList) {
				if (value != null && value.equals(book)) {
					return "이미 대여한 책입니다.";
				}
			}
		}
				// 이미 대여한 책은 대여 불가능하게 만들어야 하는 경우
			    for(Book book : member.getBooklist()) {
			    	if(book != null && book.equals(books[select-1])) {
			    	  System.out.println("이미 대여한 책입니다.");
			    	  check = false;
			    	  break;
			    	}
			    }
				
			    if (count < 2) {
			    	
			    	if(member.getAge() < book.getAccessAge()) {
			    		return "나이 제한으로 대여 불가능";
			    	} else {
			    // select 번호에 따라서 해당 책이 Member - bookList에 추가
				member.getBooklist()[count++] = books;
				
				// 쿠폰을 가지고 있는 경우
				if(book.isCoupon()) {
					member.setCoupon(member.getCoupon() + 1);
				}
				
				System.out.println("도서가 대여 되었습니다.");
				}
			    
			    check = true;
			    
				}
				} else {
					System.out.println("더이상 대여할 수 없습니다.");
				
		}
		
	}
}
