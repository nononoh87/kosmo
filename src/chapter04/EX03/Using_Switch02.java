package chapter04.EX03;

import java.util.Scanner;

public class Using_Switch02 {

	public static void main(String[] args) {
		// Switch 문으로 처리
		// 스캐너 사용
		//에스프레소, 아포가토, 카페라떼 주문할 경우 가격이 3,500원
				//아메리카노를 주문할 경우 : 2,500원
				//그 외의 메뉴를 출력할 경우 : 우리 매장에 없는 메뉴입니다.
				
				//출력: 주문하신 <에스프레소>는 가격이 <3,500>원 입니다.
				//     우리 매장에 없는 메뉴입니다.
		
		Scanner sc = new Scanner(System.in);
		System.out.println("메뉴를 입력하세요");
		String order = sc.next();
		int prise = 0;
		
		switch (order) {
		case "에스프레소" : case "아포가토" : case "카페라떼" :
			prise = 3500;
			break;
		case "아메리카노":
		    prise = 2500;
			break;
		default:
			System.out.println("우리 매장에 없는 메뉴입니다.");
		}
		
		System.out.printf("주문하신 커피는 %s 이고, 가격은 %d원 입니다.", order, prise);
		
		sc.close();
	    
		
		
		
		
		
		

	}

}
