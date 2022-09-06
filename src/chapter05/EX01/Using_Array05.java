package chapter05.EX01;

import java.util.Arrays;

public class Using_Array05 {

	public static void main(String[] args) {
		//1~500 까지 3의 배수를 배열에 저장
		//출력 : 1. 직접 출력, 2. for 출력, 3.Enhanced For, 4.toString()
		//합계:   평균:
		
		//1. 배열 선언 (3의 배수의 갯수 : 166개)
		int[] arr = new int[166];
		
		//1. 배열에 3의 배수 저장
		int count =0; //3의 배수의 갯수
		for (int i =0, j = 3 ; i < arr.length; i++, j+=3) {
			if (j <= 500) {
				arr[i] = j;
				count++;
			}
		}
		//2. 출력 System.out.println("직접 출력")
		System.out.println(arr[0]);
		
		System.out.println("2. for 출력");
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		System.out.println("총 3의 배수 갯수 :" + count);
		
		System.out.println("3. Enhanced For 출력");
		for (int k: arr) {
			System.out.println(k);
		}
		System.out.println("4. Arrays.toString() 출력");
		System.out.println(Arrays.toString(arr));
		
		//합계 구하기
		int sum = 0;
		for (int i =0 ; i < arr.length ; i ++) {
			sum += arr[i];
		}
		System.out.println("합계 :" + sum);
		System.out.println("평균" + sum / (double)count);
		
		
			
      
		
		
		
		

	}

}
