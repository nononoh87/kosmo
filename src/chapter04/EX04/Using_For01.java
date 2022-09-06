package chapter04.EX04;

public class Using_For01 {

	public static void main(String[] args) {
		/*
		 for (초기값 ; 조건 ; 증가값) {
		      실행문;     <==조건이 참 일동안 계속 반복 , 거짓이면 for 을 빠져나옴
		 }     
		 */
		
		//기본 for 문
		int a;
		for (a = 0 ; a < 3 ; a++) {  //(초기값 ; 조건 ; 증가값) 
			System.out.println(a);
		}   // 0 1 2
		
		System.out.println("====================");
		//초기값과 증가값에는  ,로 구분해서 여러개의 변수가 올 수 있다.
		
		int b , c , d;
		for (b = 0, c = 10, d = 20; b < 5 ; b++, c += 2, d += 5) {  //5번반복(0, 1, 2, 3, 4)
			// b: 1씩 증가, c: 2씩 증가, d: 5씩 증가
			System.out.println("b : " + b +" c :" + c + " d :" + d);
			//c+= 2;
			//d+= 5;
		}
		
		System.out.println("======================");
		
		//for 문에서 무한루프 (조건이나 증가값을 잘못 처리할 경우)
		int e;
		for (e = 0; e < 10 ; e += 3) {
			System.out.println(e);         // 조건이 true일 동안 반복
		}   //0 3 6 9
        
		System.out.println("=====for문 없이 : 1~10까지 덧셈=====");
		// 1부터 10까지 for 없이 덧셈
		
		int sum1 ;
		sum1 = 0;   //0
		sum1 +=1;   // sum1 = sum1 + 1   //1
		sum1 +=2;   // sum1 = sum1 + 2   //3
		sum1 +=3;   // sum1 = sum1 + 3   //6
		sum1 +=4;   // sum1 = sum1 + 4   //10
		sum1 +=5;   // sum1 = sum1 + 5   //15
		sum1 +=6;   // sum1 = sum1 + 6   //21
		sum1 +=7;   // sum1 = sum1 + 7   //28
		System.out.println(sum1);
		sum1 +=8;   // sum1 = sum1 + 8   //36
		sum1 +=9;   // sum1 = sum1 + 9   //45
		sum1 +=10;  // sum1 = sum1 + 10  //55 
		System.out.println("1~10까지의 합 :" + sum1);
		
		//for 문을 사용해서 1부터 10까지의 합계 구하기
		int sum2 ;
		int i;
		for (i = 1 , sum2 = 0 ; i <=10; i++) {
			sum2 += i ;
			System.out.println("sum2 :" + sum2+ ", i:" +i);
		}
		System.out.println("1부터 10까지의 합계 : " + sum2);
		
		
		//for 문을 사용해서 0~1000 까지 7의 배수의 합계
		// 7의 배수의 합계 : 000 <<완료시간 14: 50분>>>
		
		int sum3 = 0;
		
		for ( int aa = 0; aa <=1000 ; aa += 7 ) {
			sum3 += aa ;
		}
		System.out.println("0~1000까지 7의 배수의 합계:" + sum3);
		
		System.out.println("=====================");
		
		//for 문과 if 문을 사용해서 1~10까지 더한 값을 출력 하되 아래와 같이 출력하세요.
		// 결과 1+2+3+4+5+6+7+8+9+10 = 55
		
		int sum4=0;
		for (int g = 1; g <= 10; g++) {
			sum4 = sum4+g;
			System.out.print(g);         //더하는 수 출력
			if (g <= 9) {
				System.out.print(" + ");   //1~9까지는 + 출력
			}else {
				System.out.print(" = ");   //g가 10인경우 = 출력
				System.out.print(sum4);
			}
			
		}
		
	
		
		
		

	}

}
