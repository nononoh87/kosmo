package chapter04.EX02;

import java.util.Scanner;

public class Using_Scanner_if05 {

	public static void main(String[] args) {
		/*
		 나이(age) 가 8세 미만이면 : "취학전 아동입니다."
		                       : "입장료는 <1000>원 입니다.
		 나이 14세 미만이면 : "초등학생입니다.
		                  "입장료는 <2000>원 입니다.
		 나이 20세 미만이면 : "중, 고등학생입니다"
		                  "입장료는 <2500>원 입니다.
		 나이 20세 이상이면 : "일반인 입니다."
		                  "입장료는 <3000>원 입니다.
		                  <<18: 20분까지 완료>>
		 */
		
		Scanner sc = new Scanner(System.in);
		System.out.println("나이를 입력하세요(0~100)>>>");
		int age = sc.nextInt();
		int prise = 0;
		
		if (age < 8) {
			System.out.println("취학전 아동입니다.");
		    prise = 1000;
		}else if (age <14){
			System.out.println("초등학생 입니다.");
			prise = 2000;
		}else if (age < 20){
			System.out.println("중, 고등학생 입니다.");
			prise = 2500;
		}else {
			System.out.println("일반인 입니다.");
			prise = 3000;
		}
		System.out.println("입장료는 "+ prise + "입니다");
        
        
        sc.close();
	}

}
