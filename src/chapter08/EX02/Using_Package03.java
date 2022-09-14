package chapter08.EX02;

//임포트를 사용하지 않고 외부패키지 접근 : 클래스의 전체 이름을 사용 (패키지명 + 클래스명)
	// A클래스 (public) (접근0), B클래스 (default) (접근X)

public class Using_Package03 {

	public static void main(String[] args) {
		
		//전체이름 : 패키지명.클래스명 (public)
		chapter08.EX01.A a= new chapter08.EX01.A();
		
		System.out.println(a.m); 	//외부 패키지에서 접근 가능 (public)
		System.out.println(a.n);	//외부 패키지에서 접근 가능 (public)
		
		a.print();					//외부 패키지에서 접근 가능 (public)
		

	}

}
