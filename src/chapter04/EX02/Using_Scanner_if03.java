package chapter04.EX02;

import java.util.Scanner;

public class Using_Scanner_if03 {

	public static void main(String[] args) {
		//if문에서 String 문자열 비교.
		//   -- 기본 자료형에서 변수의 값이 같다. : ==
		//   -- 참조자료형에서는 변수의 값이 같음을 표현할때 : 변수명 equals("값")
		//        String 변수의 값을 비교할때 : equals() 메소드를 사용해야한다
		
		
        Scanner sc = new Scanner(System.in); //sc 객체 생성
        
        System.out.println("주문할 커피 메뉴를 고르세요>>>");
        String order = sc.next();
        
        if (order.equals("아메리카노")) {
        	System.out.println("당신이 주문한 커피는 : " + order + "입니다");
        }else if (order.equals("카푸치노")) {
        	System.out.println("당신이 주문한 커피는 : " + order + "입니다");
        }else if (order.equals("카페라테")) {
        	System.out.println("당신이 주문한 커피는 : " + order + "입니다");
        }else if (order.equals("아보카도")) {
        	System.out.println("당신이 주문한 커피는 : " + order + "입니다");
        }else {
        	System.out.println("우리 메장에는 없는 메뉴입니다.");
        	
        sc.close(); //sc 객체 메모리에서 삭제
        }	
        
   }
        

}
