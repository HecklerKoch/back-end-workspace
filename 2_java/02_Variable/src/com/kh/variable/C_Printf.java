package com.kh.variable;

public class C_Printf {

	public static void main(String[] args) {

		
		// System.out,print(출력하고자하는값); -- 출력만 함 (줄바꿈 발생 X)
		// System.out.println(출력하고자하는값); -- 출력 후 줄바꿈 발생 O
		System.out.println("hello\n");
        System.out.println("hello");
       
        System.out.println("--------------------");
        
        //system.out.printf("출력하고자하는형식(포맷)", 출력하고자하는 값, 값, ...)
        // 출력하고자하는 값들이 제시한 형식에 맞춰서 출력만 진행
        int iNum1 = 10;
        int iNum2 = 20;
        
        // 10% 20%
        System.out.print(iNum1 + "% ");
        System.out.print(iNum2+ "%\n");
        
        System.out.println(iNum1 + "% " + iNum2 + "%");
        
        /*
          포맷에 쓰이는 키워드
          %d : 정수
          %f : 실수
          %c : 문자
          %s : 문자열 (문자도 가능)
         */
        System.out.printf("%d%% %d%%", iNum1,iNum2);
        System.out.println();
        System.out.println("----------------------");
        
        System.out.printf("%5d", iNum1); // 공간 5칸 확보 후 양수 오른쪽 정렬
        System.out.printf("%-5d", iNum2); // 5칸 공간 확보 후 음수 왼쪽  정렬
        
        System.out.println("----------------------");
        
        double dNum1 = 1.2345678;
        double dNum2 = 4.53;
        
        System.out.printf("%f\t%f", dNum1, dNum2); //무조건 소수점 아래 6번째 자리까지
        System.out.println();
        System.out.printf("%.1f\t%.2f", dNum1, dNum2);
        
        System.out.println();
       System.out.println("----------------------------------");
       
       char ch = 'a';
       String str = "hello";
       
       // a        hello a
       System.out.printf("%s %10s %s",ch, str, ch);
       System.out.println();
       System.out.printf("%C %S", ch, str);
       
      
       
       
       
       
       
       
       
       
        
	}

}
