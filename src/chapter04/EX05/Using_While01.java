package chapter04.EX05;

public class Using_While01 {

	public static void main(String[] args) {
		//while (조건) {
		//    실행문 ;
		// }
		
		//while 반복횟수를 알 수 없는 경우 사용.
		//for 반복 횟수를 알수 있는 경우 사용.
		
		// -- 초기값 선언을 반드시 while 밖에서 선언해야 한다.
		//       <while 문 내에서 선언시 무한 루프.>
		// -- 증가값은 while 내에서 선언을 한다. <증가값을 선언 하지 않으면 무한 루프>
		       
		       
		// 1. while 문에서 반복 횟수가 0인 경우
		System.out.println("==========반복 0=============");       
		int a = 0; //변수의 초기값은 while 밖에서 선언
		while (a < 0) {
			System.out.println(a +"");  //조건이 true 일때만 실행
			break;
		}
		
		// 2.while 문에서 반복횟수가 1번인 경우
	    System.out.println("==========반복 1=============");
	    a = 0 ;
	    while (a == 0) {
	    	System.out.println(a + "");
	    	System.out.println();
	    	break;
	    }
	    System.out.println("==========반복 1(증가값을 사용)=============");
	    a = 0 ;
	    while (a == 0) {
	    	System.out.println(a + "");
	    	a++;
	    }
	    
	    System.out.println();   //Enter
	    System.out.println("====반복 횟수 10");
	    
	    a = 0;                    //초기값 : while 밖에서 선언
	    while (a < 10) {
	    	System.out.println(a + "");
	    	   a++ ;              //증가값은 while 내에서 처리
	    }
	    
	    
	    System.out.println();
	    System.out.println("====초기값을 while 문 내에서 넣는 경우 : <무한루프>");
	    
	    
	    while (a < 10) {
	    	a = 0;                 //초기화 값을 while 문 내에서 선언하면
	    	System.out.println(a + "");
	    	   a++ ;              //증가값은 while 내에서 처리
	    }
	    
	    //while 문은 조건을 생략할 수 없다.
	    //for 문은 조건을 생략시 무한 루프
	    //while 문에서 무한 루프를 돌릴때 조건에 true
	    
	    System.out.println();
	    System.out.println("==================================");
	    
	    a = 0;
	    boolean b;
	    b = true;
	    while ( b ) {
	    	System.out.println(a + " ");
	    	a++ ;
	    	if (a > 200) {
	    		break;
	    	}
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    

	}

}
