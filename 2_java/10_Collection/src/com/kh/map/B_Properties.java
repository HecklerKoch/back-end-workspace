package com.kh.map;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

/*
  Properties 
  - HashMap 구버젼인 Hashtable(Object, Object)을 상속받아 구현한 것
  - (String, String) 형태로 단순화된 컬렉션
  - 주로 환경설정과 관련된 속성(property)을 저장하는게 사용
 */

public class B_Properties {
	
	public static void main(String[] args) {
		Properties prop = new Properties();
		
		// 키값 중복 X 순서 X
		prop.setProperty("List", "ArrayList"); // String만 올 수 있다
		prop.setProperty("set", "HashSet");    // key 값은 중복 x 중복될 경우 나눚에 들어간거로 수정됨 배열의 순서도 X
		prop.setProperty("Map", "HashMap");
		prop.setProperty("Map", "Properties");
		System.out.println(prop);
		
		Enumeration en = prop.propertyNames();
		
		while(en.hasMoreElements()) {     // 하나 하나 출력 하는법
			String key = (String) en.nextElement(); // 키값만 가져오기
			String value = prop.getProperty(key);  // 벨류값만 가져오기
			System.out.println(key + " : " + value); // 가져온 값들 출력
			
			
			
		}
		
		Set<Entry<Object, Object>> entrySet = prop.entrySet(); // 셋엔드리 방식으로 하나 하나 출력
		
		for(Entry<Object, Object> entry : entrySet) { // for ( 타입 지정한 변수 : 지정한 배열)
			System.out.println(entry.getKey() + " : " + entry.getValue());
		}
		
		
	}
}
