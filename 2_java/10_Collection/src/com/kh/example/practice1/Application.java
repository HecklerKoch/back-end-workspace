package com.kh.example.practice1;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Application {

	public static void main(String[] args) {
		
		ArrayList<Integer> lotto = new ArrayList<Integer>();
		
		//기존 로또 번호는 6개, 보너스 번호가 필요해서 1개 추가.
		while(lotto.size() < 7) {
			
		int num = (int) (Math.random() * 45 + 1);
		if(!lotto.contains(num)) {
		lotto.add(num);
		}
		
	}
		
		// 0 ~ 6까지 범위 지정해서 로또 번호 6개 따로, 보너스 번호 따로.
		List<Integer> lottolist = lotto.subList(0, 6);
		int bonus = lotto.get(6);
		
		
		int count =0;
		
		while(true) {
			
			count++;
			
			ArrayList<Integer> mylotto = new ArrayList<Integer>();
			
			while(mylotto.size() < 6) {
				
				int num = (int) (Math.random() * 45+1);
				if(!mylotto.contains(num)) {
					mylotto.add(num);
				}
			}
			
			System.out.println("로또 번호 : " + lottolist);
			System.out.println("내 번호 : "+ mylotto);
			
			Collections.sort(lottolist);
			Collections.sort(mylotto);
			
			// 멈추는 조건, 로또 번호와 내 번호가 정확히 일치. 1등 당첨.
			if(lotto.equals(mylotto)) {
				System.out.println("1등 당첨! 복권 구매 횟수 : " + count);
			break;
		}
			
			int match = 0;
			
			for(Integer num : lottolist) {
				if(mylotto.contains(num)) {
					match++;
				}
			}
			 if (match == 5) {
				 if(mylotto.contains(bonus)) {
					 System.out.println("2등 당첨, 보너스 번호 : " + bonus + ", 횟수 : " + count);
					 break;
				 } else {
					 System.out.println("3등 당첨, 횟수 : "+ count);
					 break;
				 }
			 } else if (match == 4){
				 System.out.println("4등 당첨 횟수 : " + count);
				 break;
			 } else if (match == 3) {
				 System.out.println("5등 당첨 횟수 : " + count);
				 break;
				 
				 
				 
				 
			 }
		
 		
	}

}
}
