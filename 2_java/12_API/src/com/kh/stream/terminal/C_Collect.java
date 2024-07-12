package com.kh.stream.terminal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import com.kh.stream.model.Student;

/*
  수집
  - 최종 처리 기능으로 필터링 또는 매핑한 요소들을 새로운 컬렉션으로 담아서 리턴하는
    collect() 제공 
 */

public class C_Collect {
	
	public void method1() {
		List<Student> students = Arrays.asList(
				new Student("김현호", 20, "남자", 80, 50),
				new Student("우현성", 19, "남자", 75, 60), 
				new Student("김경주", 18, "여자", 50, 100),
				new Student("주준영", 21, "남자", 60, 45), 
				new Student("조창현", 19, "남자", 70, 90),
				new Student("김진주", 19, "여자", 80, 90)
				);
		
		// list 컬렉션으로 수집 -> 수학 점수가 80점 이상인 사람들만
		List<Student> list = students.stream()
		.filter(m -> m.getMath()>=80).collect(Collectors.toCollection(() -> new ArrayList<>()));
		System.out.println(list);
		
		System.out.println();
		
		// set 컬렉션으로 수집 -> 고등학생인 사람들만, hashSet
		Set<Student> List1 = students.stream()
		.filter(a -> a.getAge() >= 17 && a.getAge() <=19).collect(Collectors.toCollection(() -> new HashSet<>()));
		System.out.println(List1);
		
		System.out.println();
		
		// Map 컬렉션으로 수집 -> 키 : 이름, 값 : 나이 (toMap)
		Map<String, Integer> map = students.stream().collect(Collectors.toMap(n -> n.getName(), a -> a.getAge()));
		System.out.println(map);
		
	}

	public static void main(String[] args) {
		C_Collect c = new C_Collect();
		c.method1();
	}

}
