package chapter09.EX02;

import chapter09.EX01.A;

//class D는 class A를 상속 받는다. (패키지 외부에서 상속 설정)
	//D 클래스는 A 클래스의 필드와 메소드를 상속 받는다. 

	//protected 접근 제어자 : 상속 관계에 있을때만 외부 패키지에서 접근 가능


public class D extends A {
	
	public void print() {
		System.out.println("==부모 클래스의 필드 출력(다른 패키지)==");
		System.out.println(a);		//public	//다른 패키지에서 접근됨
		System.out.println(b);		//protected	//다른 패키지에서 접근됨 (상속)
		//System.out.println(c);	//default	<오류 발생>
		//System.out.println(d);	//private	<오류 발생>
		
		System.out.println("==부모 클래스의 메소드 출력(다른 패키지)==");
		print1();	//public
		print2();	//protected
		//print3();	//default
		//print4();	//private
	}
	
	
	
	
	
	
	

}
