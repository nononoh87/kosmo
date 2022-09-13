package chapter07.EX04;

class Person {
	// class : 객체를 생성하기 위한 템플릿(틀), 붕어빵기계, 설계도
	// object(객체, 인스턴스) : 붕어빵, 건축물 <== 인스턴스화

	// 1. 필드 : 클래스 블락에서 선언된 변수(Heap), 지역변수 : 메소드 블락에서 선언된 변수 (Stack)
	String name; // 이름 : null
	float height; // 키 (실수) : 0.0
	float weight; // 몸무게 (실수) : 0.0
	int age; // 나이 : 0

	// 2. 생성자 (Constructor) : 1. 리턴타입이 없다. 2. 클래스 이름과 동일 (메소드)
	// 필드의 기본값을 초기화
	// 생성자 오버로딩 : 생성자 이름은 동일, 식별자 (인풋매개변수 타입, 갯수)
	Person() { // 기본 생성자 : 인풋 값이 비어있는 생성자, 생략 가능
	}

	Person(String s) { // this 키워드 없이 필드에 값 할당, 변수명이 다르다.
		name = s;
	}

	Person(String name, float height) { // this : 인풋 매개변수명, 값을 받는 변수, 필드명이 다르다.
		this.name = name;
		this.height = height;
	}

	Person(String name, float height, float weight, int age) {
		this.name = name;
		this.height = height;
		this.weight = weight;
		this.age = age;
	}

	// 3. 메소드 (함수) : 기능을 실행하는 코드가 저장. 호출시 작동, 메소드명();

	void show() { // 필드의 내용을 출력하는 메소드
		System.out.println(name + " , " + height + "," + weight + "," + age);
	}

	//4. getter, setter <== 필드의 배용을 출력, 필드의 내용을 입력
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}

public class Using_Object_review {

	public static void main(String[] args) {
		// 객체 생성, main method
		
		//1. 기본 생성자 호출
		Person person = new Person();
			//필드 내용 출력 (1. 객체 명으로 출력)
		System.out.println(person.name);
		System.out.println(person.height);
		System.out.println(person.age);
		
			//getter를 사용해서 필드의 내용을 출력 (//필드의 값을 리턴)
		System.out.println("====getter를 사용해서 출력====");
		System.out.println(person.getName());
		System.out.println(person.getHeight());
		System.out.println(person.getWeight());
		System.out.println(person.getAge());
		
			//show() : 필드의 내용을 출력
		System.out.println("====show() 메소드 호출====");
		person.show();
		
		//2. 매개변수가 1개인 생성자를 호출
		System.out.println("====매개변수 1개 출력====");
		Person Lee = new Person("이순신");
		//필드 내용 출력 (1. 객체 명으로 출력)
		System.out.println(Lee.name);		//이순신
		System.out.println(Lee.height);		//0.0
		System.out.println(Lee.weight);		//0.0
		System.out.println(Lee.age);		//0
		
		Lee.show();
		
		//3. 매개변수가 4개인 생성자 호출
		System.out.println("====매개변수 4개 생성자 호출====");
		Person hong = new Person ("홍길동", 185.5F, 80.3F, 35 );
		System.out.println(hong.name);		//이순신
		System.out.println(hong.height);		//0.0
		System.out.println(hong.weight);		//0.0
		System.out.println(hong.age);		//0
		
		hong.show();
		
		//Setter를 사용해서 필드의 값 할당, Getter를 사용해서 필드의 값 출력
		
		System.out.println("====Setter/Getter 사용====");
		Person jung = new Person();
		
		//setter을 사용해서 필드에 값 할당.
		jung.setName("정도령");
		jung.setHeight(175.5F);
		jung.setWeight(85.3F);
		jung.setAge(40);
		
		//getter를 사용해서 필드의 값을 호출
		System.out.println(jung.getName());
		System.out.println(jung.getHeight());
		System.out.println(jung.getWeight());
		System.out.println(jung.getAge());
		
		jung.show();
		
		
		

	}

}
