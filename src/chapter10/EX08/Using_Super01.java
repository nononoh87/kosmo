package chapter10.EX08;

//super keword : 상속 관계에서 부모 클래스(super class) 의 필드, 메소드를 호출
//super Method : 상속 관계에서 부모 클래스의 생성자를 호출
//				-- 생성자 내부에서 사용, 반드시 첫 라인에 와야한다.

//this keword : 자기 자신 객체의 필드, 메소드 호출
//this Method : 자기 자신 객체의 생성자 호출
//				-- 생성자 내부에서 사용, 반드시 첫 라인에 와야 한다.

class A {
	void abc() {
		System.out.println("A 클래스의 abc()");
	}
}
class B extends A {
	@Override
	void abc() {	//오버라이딩된 메소드
		System.out.println("B 클래스의 abc()");
	}
	void bcd() {
		abc();		//this.abc()				//B 클래스의 abc()
		super.abc(); 	//부모 클래스의 메소드 호출	//A 클래스의 abc()
	}
}

public class Using_Super01 {

	public static void main(String[] args) {
		//1. 객체 생성
		B bb =new B();
		
		//2. 메소드 호출
		bb.bcd();

	}

}
