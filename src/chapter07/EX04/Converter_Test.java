package chapter07.EX04;

import java.util.Scanner;

class Converter {	//환률을 계산하는 클래스
	//1. 필드
	double rate;	//환률을 저장하는 변수 : 1$ = 1377.30
	
	//2. 메소드 생성 (달러를 인풋 받아서 원화를 반환하는 메소드), 메소드 이름 toKWR()
	double toKWR(double dollar) {
		return dollar * rate;
	}
	//3. 메소드 생성 (원화를 인풋받아서 달러를 반환하는 메소드), 메소드 이름 : toDollar()
	double toDollar(double won) {
		return won / rate;
	}
	//4. setRate() 메소드 생성 : setter를 사용해서 rate 필드의 값을 할당.
	void setRate(double rate) {
		this.rate = rate;
	}
	
	
}

public class Converter_Test {

	public static void main(String[] args) {
		//네이버를 검색해서 오늘 환률을 알아와서
		//객체 생성후 스캐너로 환률을 인풋받아서 setRate() 메소드에 저장후
		// 원화 100만원 ===> 몇 $인지 출력
		// 달러 $100   ===> 몇 만원인지 출력
		Scanner sc = new Scanner(System.in);
		
		System.out.println("1달러에 대한 오늘 환율을 입력하세요>>>");
		double rate = sc.nextDouble();
		
		//객체 생성
		Converter converter = new Converter();	//기본 생성자 호출(생략됨)
		
		//스캐너로 받은 rate 변수의 값을 setter 주입
		converter.setRate(rate);
		
		//100만원 ==> 몇 $
		
		System.out.println("원화 100만원은 " + converter.toDollar(1000000) + "$입니다");
		
		//100 $ ==> 몇 만원
		
		System.out.println("100$는 " + converter.toKWR(100) + "만원 입니다");
		
		//1. printf()를 사용해서 출력.
		System.out.println("==소수점 2째 자리까지 잘라서 출력(printf())==");
		
		System.out.printf("원화 100만원은 %.2f $입니다. ", converter.toDollar(1000000));
		System.out.println();
		System.out.printf("100$는 %.2f 원입니다. ", converter.toKWR(100));
		
		//2. 변수에 더블 값을 할당후 소숫점 2자리까지 변환해서 출력
		
		System.out.println("==========예시==========");
		double per2 = 3.141592;
			//String 으로 변환후 per2의 변수값을 소숫점 2자리까지 출력후 다시더블형으로 변환
		double per1 = Double.parseDouble(String.format("%10.2f", per2));
		System.out.println(per1);
		
		System.out.println("==실수를 변수에 할당후 소수점 2자리까지 자른후 다시 더블레 지정==");
		double d2 = converter.toDollar(1000000); //실수를 리턴 받아서 d2에 할당.
		double d1 = Double.parseDouble(String.format("%.2f", d2));
		System.out.println("원화 100만원은 " + d1 + "$ 입니다.");
		
		double d4 = converter.toKWR(100);
		double d3 = Double.parseDouble(String.format("%.2f", d4));
		System.out.println("100$는 " + d3 + "만원입니다. ");
		
		
		
		
	}

}
