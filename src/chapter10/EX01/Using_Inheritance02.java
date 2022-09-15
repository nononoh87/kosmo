package chapter10.EX01;

class Fruit {		//과일 <==부모 클래스
	String name;	//과일 이름
	String color;	//과일 색깔
	int large;		//과일 크기
	
	void eat() {
		System.out.println("모든 과일은 맛이 있습니다");
	}
	void print() {
		System.out.println(name + " , " + color + " , " + large);
	}
	
}
class Apple extends Fruit {		//사과 <==자식 클래스
	//자식 클래스만 가지는 필드1, 메소드1
	int appleCount;
	void show () {
		System.out.println("사과의 갯수 : " + appleCount);
	}
	
}
class Orange extends Fruit {		//오렌지 <==자식 클래스
	//자식 클래스만 가지는 필드1, 메소드1
	int orangeCount;
	void show () {
		System.out.println("오렌지의 갯수 : " + orangeCount);
	}
	
}
class Banana extends Fruit {		//바나나 <==자식 클래스
	//자식 클래스만 가지는 필드1, 메소드1
	int bananaCount;
	void show () {
		System.out.println("바나나의 갯수 : " + bananaCount);
	}
}

public class Using_Inheritance02 {

	public static void main(String[] args) {
	//1. Fruit 객체 출력
	System.out.println("==Fruit 객체 출력==");	
	Fruit f = new Fruit();
	
	f.name = "과일";
	f.color = "과일 색깔";
	f.large = 10;
	
	f.eat();
	f.print();
		
	System.out.println("==Apple 객체 출력==");	
	Apple a = new Apple();
	a.name = "사과";		//상속 필드
	a.color = "빨간색";	//상속 필드
	a.large = 8;		//상속 필드
	a.appleCount = 30;	//자신의 필드
	
	a.eat();			//상속 메소드
	a.print();			//상속 메소드
	a.show();			//자신의 메소드
		
	System.out.println("==Orange 객체 출력==");
	Orange o = new Orange();
	o.name = "오렌지";
	o.color = "오렌지색";
	o.large = 5;
	o.orangeCount = 15;
	
	o.eat();
	o.print();
	o.show();
	
	System.out.println("==Banana 객체 출력==");
	Banana b =new Banana();
	b.name = "바나나";
	b.color = "노란색";
	b.large = 10;
	b.bananaCount = 20;
	
	b.eat();
	b.print();
	b.show();
	
	
	}

}
