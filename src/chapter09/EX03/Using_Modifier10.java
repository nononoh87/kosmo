package chapter09.EX03;

//기존 클래스의 외부 클래스 생성 : 다른 패키지에서 접근이 불가능
	// 간단하게 외부 패키지에서는 접근이 불가능, 같은 패키지에서 만 사용할 경우

//외부 패키지에서  A 클래스를 사용하도록 할때는 별도의 파일로 생성해야 한다. 


class A {	//default 접근 지정자가 생략됨. 다른 패키지에서는 접근이 불가능
	
	int m = 10;
	int n = 20;
	
	void print() {
		System.out.println(m + " , " + n);
	}
	
}

public class Using_Modifier10 {

	public static void main(String[] args) {
		//
		A a = new A();
		a.print();
		
		
		
		

	}

}
