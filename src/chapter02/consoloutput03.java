package chapter02;

public class consoloutput03 {
    public static void main(String[] args) {
		//# System.out.println();
    	System.out.println("안녕 하세요");
    	System.out.println("안녕" + "하세요");  // + : 문자열을 <연결 연산자>
    	System.out.println(2 + 4);           // + : 정수일때는 <더해라>
    	System.out.println(2 + "4");         // + : 정수+ 문자열 : <연결>
    	System.out.println("문자" + 1);       //<연결>
    	System.out.println("문자" + 1 + 3);   //문자13, <연결>
    	System.out.println(1+3 + "문자");     //4문자
    	System.out.println();
    	
    	int a = 5 ;
    	String b = "하세요";
    	int c = 7;
    	System.out.println(a);
    	System.out.println(b);
    	System.out.println("안녕" + b);
    	System.out.println(a + b);       // + : 연결
    	System.out.println(a + c);       // + : 덧샘
    	System.out.println(a + "안녕" + b);
    	
    	
    	//# System.out.print();
    	System.out.print("반갑");
    	System.out.print("습니다");
    	System.out.print(7);
    	
    	System.out.print("\n");
    	System.out.print("\n");
    	
    	//# System.out.printf();
    	
    	int d = 45;
    	String e = "화요일";
        String f = "남자";
        
        System.out.println("당신의 나이는" + d +"살고, 오늘은" + e +
        		"이고, 당신은 " + f + "입니다."
        		);
        System.out.printf("당신의 나이는 %d 이고, 오늘은 %s 이고, 당신은 %s입니다.",
        		d, e, f );
        
        int g =100;
        String h = "일요일";
        String i = "여자";
        
        //여자의 평균 나이는 100살이 될것입니다. 평균적으로 일요일에 많이 태어났습니다.
        
        System.out.println(i +"는 평균 나이는" + g + "살이 될것입니다. 평적으로"
        		+ h +"에 많이 태어났습니다.");
        System.out.printf("%s 의 평균 나이는 %d 가 될것입니다. 평균적으로 %s 에 많이 태어났습니다."
        		,i,g,h);
	}
}
