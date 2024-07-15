package com.kh.step3;

import java.awt.Toolkit;

public class BeepPrintTest {

	public static void main(String[] args) {
		
		// 경고음 5번 울리는 작업
		Toolkit tool = Toolkit.getDefaultToolkit();
		tool.beep();
		
		for(int i = 0; i < 5 ; i++) {
			try {
				Thread.sleep(1000);
			} catch(InterruptedException e) {
				e.printStackTrace();
			}
		
			
				}
		//띵띵띵띵띵을 5번 출력하는 작업
		for(int i = 0; i <5; i++) {
			System.out.println("띵~");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		} 
	}

}
