package chapter07.EX05;

class Car {
	
	String companyName;		//현대자동차
	String color;			//검은색
	double maxSpeed;		//200.0 km/h
	
	Car () {}
	
	//생성자
	Car(String companyName) {
		this();
		this.companyName = companyName;
	}
	Car(String companyName, String color) {
		this(companyName);
		this.color = color;
	}
	Car(String companyName, String color, double maxSpeed) {
		this(companyName, color);
		this.maxSpeed = maxSpeed;
	}
	//필드의 모든값을 출력 메소드 (print())
	void print() {
		System.out.println("회사의 이름 : " + companyName);
		System.out.println("자동차의 색 :" + color);
		System.out.println("자동차의 속도 :" + maxSpeed);
	}
	
}
public class ThisMethod04 {

	public static void main(String[] args) {
		//this keyword, this Method 를 사요애서 처리.
		
		//1. 매개변수 0개일때, 기본 필드의 값 출력
		Car car1 = new Car();
		car1.print();
		//2. 매개변수 1개일때, companyName만 출력, 나머지는 기본값 출력
		Car car2 = new Car("현대자동차");
		car2.print();
		//3. 매개변수 2개일때
		Car car3 = new Car("현대자동차", "검은색");
		car3.print();
		//4. 매개변수 3개일때
		Car car4 = new Car("현대자동차", "검은색", 200);
		car4.print();
	}

}
