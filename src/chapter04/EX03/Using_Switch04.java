package chapter04.EX03;

import java.util.Scanner;

public class Using_Switch04 {

	public static void main(String[] args) {
		/*2. 문제
	       스캐너로 월을 인풋받아서 해달 월의 총 날짜를
	       "<월>은 <몇일> 일까지 있습니다."
        */
		
		Scanner sc = new Scanner(System.in);
		System.out.println("달을 입력하세요>>>");
		int month = sc.nextInt();
		int day = 0;
		
		switch (month) {
		case 1:case 3:case 5:case 7:case 8:case 10:case 12:
			day = 31;
			break;
		case 4:case 6:case 9:case 11:
			day = 30;
			break;
		case 2:
			day = 28;
			break;
		default:
			System.out.println("존재하지 않는 달 입니다.");
		}
		System.out.printf("%d 달은 %d 일 까지 존재 합니다.", month, day);
		
		sc.close();
	}
       
}
