package com.kh.polymorphism;

import com.kh.polymorphism.controller.EmployeeController;
import com.kh.polymorphism.model.child.Engineer;
import com.kh.polymorphism.model.child.Manager;
import com.kh.polymorphism.model.child.Secretary;
import com.kh.polymorphism.model.parent.Employee;

/* 
  다형성(Polymorphism)
  - 하나의 객체변수가 여러가지 모양과 모습을 가지는 능력
  - 부모 타입으로 자식 객체를 생성하는 것
 */

public class Application {

	public static void main(String[] args) {
		
		Employee e1 = new Employee("우현성", 10000);
		Engineer e2 = new Engineer("이동엽", 5000, "자바", 200);
		Manager m1 = new Manager("윤유진", 7000, "개발팀");
		Secretary s1 = new Secretary("송준호", 6000, "우현성");
		
		System.out.println(e1);
		System.out.println(e2);
		System.out.println(m1);
		System.out.println(s1);
		
		Employee e3 = new Engineer("이동엽", 5000, "자바", 200);
		Employee m2 = new Manager("윤유진", 7000, "개발팀");
		Employee s2 = new Secretary("송준호", 6000, "우현성");
		
		System.out.println();
		//다형성 + 객체 배열
		Employee[] empArr = {e1, e3, m2, s2};
		
		for(Employee employee : empArr) {
			System.out.println(employee);
		}
		System.out.println();
		
		EmployeeController ec = new EmployeeController();
		//System.out.println(ec.findEmployeeByName("윤유진", empArr));
		Employee result = ec.findEmployeeByName("윤유진", empArr);
		System.out.println(result);
		
		ec.getAnnualSalary(result);
	}
	
	public int getAnnualSalary(Employee e) {
		if(e instanceof Engineer) { // 특정 자식 객체 찾는 방법
			Engineer engineer = (Engineer) e; // 부모 -> 자식 : 강제 형 변환
			return e.getSalary() * 12 + engineer.getBonus();		
			
			
			System.out.println(ec.getTotalSalary(empArr));
		}
		return e.getSalary() * 12;
		
	}
}
