package chapter04.EX03;

import java.util.Scanner;

public class Using_Switch03 {

	public static void main(String[] args) {
		/*1. 문제
		      스캐너로 "Gold" 를 넣으면 "금메달 입니다" 를 출력
		      스캐너로 "Silver" 를 넣으면 "은메달 입니다" 를 출력
		      스캐너로 "Bronze" 를 넣으면 "동메달 입니다" 를 출력
		      그 외는 메달이 없습니다.
		      
		      2. 문제
		       스캐너로 월을 인풋받아서 해달 월의 총 날짜를
		       "<월>은 <몇일> 일까지 있습니다."
		 */

		Scanner sc = new Scanner(System.in);
		System.out.println("축하합니다");
		String order = sc.next();
		
		switch (order) {
		case "Gold":
			System.out.println("금메달 입니다.");
			break;
		case "Silver":
			System.out.println("은메달 입니다.");
			break;
		case "Bronze":
			System.out.println("동메달 입니다.");
			break;
		default:
			System.out.println("메달이 없습니다.");
		}
		sc.close();
		
		System.out.println("======================");
		
		Scanner sc2 = new Scanner(System.in);
		System.out.println("달을 입력하세요.");
		int month = sc2.nextInt();
		int day = 0;
		
		switch (month) {
		case 1: case 3: case 5: case 7: case 8: case 10: case 12:
			day = 31;
			break;
		case 4:case 6:case 9:case 11:
			day = 30;
			break;
		case 2:
		    day = 28;
		    break;
		default:
			System.out.println("결과 값이 없습니다");
		
		}
		sc2.close();
	}

}
