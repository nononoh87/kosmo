package chapter04.EX02;

import java.util.Scanner;

public class Using_Scanner_if {

	public static void main(String[] args) {
		// 문제 : Scanner로 정수값을 인풋 받아서
		//국어(aa), 영어(bb), 수학(cc), 과학(dd), 음악(ee) 점수를
		//인풋 받습니다.
		//if 문을 사용해서 평균이 90점 이상이면 "A학점", 80점이상 "B학점"
		// 70점이상 : "C학점", 60점이상 : "D학점", 나머지 : "F학점"
		
		//<완료시간 : 15: 50분까지>
		
		System.out.println("각 과목 점수를 입력하세요");
		Scanner sc = new Scanner(System.in);
		
		int aa = sc.nextInt();
		int bb = sc.nextInt();
		int cc = sc.nextInt();
		int dd = sc.nextInt();
		int ee = sc.nextInt();
		System.out.println("국어" + aa + "영어" + bb + "수학" + cc + "과학" + dd +
				"음악" + ee);
		
		double avg = (aa + bb + cc + dd + ee) / 5.0;
		
		if (avg >= 90.0) {
			System.out.println("A학점 입니다. :" +avg);
		}else if (avg >= 80.0) {
			System.out.println("B학점 입니다. :" +avg);
		}else if (avg >= 70.0) {
			System.out.println("C학점 입니다. :" +avg);
		}else if (avg >= 60.0) {
			System.out.println("D학점 입니다. :" +avg);
		}else {
			System.out.println("F학점 입니다. :" +avg);
		}
		
		sc.close();
		
		
		
		

	}

}
