package chapter05.EX01;

import java.util.Scanner;

public class Using_Array11 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		// 탁구 야구 축구 농구 씨름
		// 각 운동 종목의 구성원 수의 합과 평균

		String s;
		do {
			System.out.println("각 종목의 구성원 수를 공백을 이용해서 넣으세요.>>>");
			s = sc.nextLine();
			if (s.equals("그만")) {
				break;
			}
			String[] arr;
			arr = s.split(" ");
			int b; // 각 종목의 구성원을 담는 변수
			int sum = 0; // 각 종목의 구성원의 합을 담는 변수
			int count = 0; // 각 종목을 카운트 하는 변수
			for (int i = 0; i < arr.length; i++) {
				if (i % 2 != 0) { // i를 2로 나눈 나머지와 0이 같지 않다. ***
					b = Integer.parseInt(arr[i]); // a==b => a와 b가 같다.
					sum += b; // a!=b => a와 b가 같지 않다.
					count++;
				}
			}
			System.out.println("종목의 갯수 : " + count);
			System.out.println("구성원의 합 : " + sum);
			System.out.println("구성원의 평균 : " + (double) count);
			System.out.println();

		} while (true);
		System.out.println("프로그램을 종료합니다.");

	}

}
