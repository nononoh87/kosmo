package chapter04.EXU07;

public class Using_Continue {

	public static void main(String[] args) {
		// continue : continue를 만나면 continue 아래의 코드를 실행하지 않고 반복
		// - if 문과 같이 사용됨.
		
		//단일 loop에서 continue
		for (int i =0 ; i < 10 ; i ++) {  //0~9 : 10번
			System.out.println("A");
			continue;                     //구문을 빠져나가지 않고
			//System.out.println("B");    //도달할 수 없는 코드
		}
		
		for (int i =0 ; i < 10 ; i ++) {  //0~9 : 10번
			System.out.println("A");
			if (i %2 == 0) {continue;}    // i : 1, 2, 4, 6, 8,
			System.out.println("B");
		}
		
		System.out.println("======================");
		for (int i = 0; i < 10; i++) {
			if (i == 5 || i == 7) {continue;}
			System.out.print(i + " ");
	    }
		System.out.println();
		//1. for 문을 사용해서 1에서 1000까지 1씩 증가하고 continue를 사용해서
		//   3의 배수만 출력 하세요.
		System.out.println("3의 배수만 출력");
		for (int i = 0 ; i <= 1000 ; i++) {
			if (i % 3 != 0) {continue;}
			System.out.println(i);
		}
		System.out.println();
		//2. for 문을 사용해서 1에서 1000까지 1씩 증가하고 continue를 사용해서
	    //   5의 배수만 출력 하세요.
		System.out.println("5의 배수만 출력");
		for (int i =0 ; i <= 1000 ; i++) {
			if (i % 5 != 0) {continue;}         //5의 배수가 아니것은 continue로 올려보냄
			System.out.println(i);              //5의 배수만 출력
		}
	    System.out.println();
	    //3. for 문을 사용해서 1에서 1000까지 1씩 증가하고 continue를 사용해서
	  		//   3, 5, 7의 배수만 출력 하세요.
	    System.out.println("3, 5, 7의 배수만 출력");
		for (int i =0 ; i <= 1000 ; i++) {
			if ((i % 3 != 0) || (i % 5 != 0) || (i % 7 != 0)) {
			System.out.println(i);	
		}
		System.out.println();	
		}
	    
		System.out.println("=================");
		//2. 다중 loop 에서 continue
		for (int i = 0 ; i < 5 ; i++) {           //5번
			for (int k = 0 ; k < 5 ; k++) {       //5번
				if (k == 3) {continue;}
				System.out.println(i + " , " + k);
			}
		}
		
		System.out.println("===lable를 사용해서 점프함.====");
		out: for (int i = 0 ; i < 5 ; i++) {           //5번
			 for (int k = 0 ; k < 5 ; k++) {       //5번
				 if (k == 3) {continue out;}
				 System.out.println(i + " , " + k);
			}
		}
		
		System.out.println("=====================");
		out: for (int i = 0 ; i < 5 ; i++) {           //5번
			 for (int k = 0 ; k < 5 ; k++) {       //5번
				 if (k == 3) {
					 i =100;        //바깥쪽 for 문의 변수값을 증대 시켜서 false 빠져나옴.
					 continue out;}
				 System.out.println(i + " , " + k);
			}
		}
	
	}
    

}
