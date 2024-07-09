package com.kh.list;

import java.util.Queue;
import java.util.Stack;
import java.util.Vector;

public class B_Other {
	/*
	   Vector
	   - 동기화된(synchronized) 메서드로 구성 (개념은 스레드에서~)
	 */
	
	public void method1() {
		Vector v = new Vector();
		v.add(0);
		v.add(1);
		v.add(2);
		v.add(3);
		v.add(4);
		v.add(5);
		v.add(6);
		v.add(7);
		v.add(8);
		v.add(9);
		v.add(10);
		
		System.out.println(v);
		System.out.println("size : " + v.size());
		System.out.println("capacity : "+ v.capacity());
		
		v.trimToSize();
		
		System.out.println("size : " + v.size());
		System.out.println("capacity : " + v.capacity());
		
	}
	
	// 스택(stack) : 마지막에 저장한 것을 제일 번저 꺼내는 LIFT(Last In First Out)
	public void method2() {
		Stack s = new Stack();
		s.push(0);
		s.push(1);
		s.push(2);
		s.push(3);
		s.pop();
		s.push(4);
		s.pop();
		s.push(5);
		s.push(6);
		s.push(7);
		s.pop();
     System.out.println(s);
	}
	
	// 큐(Queue) : 처음에 저장한 것을 제일 먼저 꺼내는 FILO (First In Last Out)
	public void method3() {
		
		Queue q = new Queue();
		q.offer(0);
		q.offer(1);
		q.offer(2);
		q.offer(3);
		q.poll();
		q.add(4);
		q.remove();
		q.add(5);
		q.add(6);
		q.add(7);

		
	}
	
	public static void main(String[] args) {
		B_Other b = new B_Other();
		b.method1();
	}

}
