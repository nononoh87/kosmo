package chapter04.EX04;

import java.util.Scanner;

public class Using_For03 {

	public static void main(String[] args) {
		// for 문 내의 if
		// 정수 (음수, 양수) 을 스캐너로 5개 인풋 받아서
		// 양수만 더한 값과 평균값을 출력 하세요.

		Scanner sc = new Scanner(System.in);		// 입력 할수 있게 

		int sum1 = 0; // 양수만 더함					// 그릇을 만들어줌
		int sum = 0; // 모든수를 더함
		int count = 0; // 양수의 카운트 하는 변수
		int count1 = 0; // 모든수를 카운트함
		
		System.out.println("정수 5개를 입력하세요. (음수, 양수)");		// 콘솔창에 글을 띄워준다...
		
		for (int i = 0; i < 5; i++) {			// i=0					//i=1			//i=2		//i=3 		//i=4	
			int n = sc.nextInt();
			sum += n; // 입력받은 모든수를 더함		//sum1 = 0 + 10 =1=0	=10+20 = 30		sum1 = 150
			count++; // 모든수를 카운트				//count = 0+1 = 1		=1+1 =2
			if (n > 0) {						//n = 10 이상				만족을 하네?
				sum1 += n;						//sum = 0 + 10 = 10		10 + 20 = 30
				count1++; // 양수일때 1씩 증가		//count1 = 0 +1 = 1		1 + 1 = 2
			}
		}
		
		System.out.println("모든수의 합:" + sum + ", 모든수의 평균" + sum / (double) count);
		System.out.println("양수의 합 :" + sum1 + ", 양수의 평균:" + sum1 / (double) count1);

		sc.close();
	}

}
