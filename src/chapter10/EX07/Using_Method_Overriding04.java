package chapter10.EX07;

class Animal{
	// 자식 클래스에서 두개 메소드 오버라이딩
	//  Animal타입으로 정의, 배열에 저장 후 오버라이딩 된 메소드 출력 ( for, Enhanced For)
	void run() {
		System.out.println("모든 동물은 달립니다.");
	}
	void eat() {
		System.out.println("모든 동물은 먹습니다.");
	}
}
class Tiger extends Animal{
	int count;		//호랑이 수
	//생성자 : 정수를 인풋 받아서 count 필드에 값 할당.
	Tiger (int count) {
		this.count = count;
	}
	
	@Override
	void run() {
		System.out.println("호랑이가 달립니다.");
	}
	void eat() {
		System.out.println("호랑이가 고기를 먹습니다.");
	}
}
class Egle extends Animal{
	int count;		//독수리 수
	
	Egle (int count) {
		this.count = count;
	}	
	@Override
	void run() {
		System.out.println("독수리는 날라다닙니다.");
	}
	void eat() {
		System.out.println("독수리가 고기를 먹습니다.");
	}
	
}
class Fish extends Animal{
	int count;		//물고기 수
	
	Fish (int count) {
		this.count = count;
	}	
	@Override
	void run() {
		System.out.println("물고기는 헤엄을 칩니다.");
	}
	void eat() {
		System.out.println("물고기는 해조류를 먹습니다.");
	}
}
class Dog extends Animal{
	int count;		//개의 수
	
	Dog (int count) {
		this.count = count;
	}	
	@Override
	void run() {
		System.out.println("강아지는 신나게 뛰어다닙니다.");
	}
	void eat() {
		System.out.println("강아지는 고기를 먹습니다.");
	}
}

public class Using_Method_Overriding04 {

	public static void main(String[] args) {
		//1. 객체 생성
		//1. 객체 생성 (Animal 타입으로 생성)
			//생성자를 통해서 각각의 필드에 값을 할당.
		
		Animal a1 = new Animal();
		Animal a2 = new Tiger(10);
		Animal a3 = new Egle(5);
		Animal a4 = new Fish(50);
		Animal a5 = new Dog(70);
				
		//객체를 배열에 저장
		Animal[] arr1 = new Animal[] {a1,a2,a3,a4,a5};
		//For문을 사용해서 출력 : eat(), run(), 동물의 총 마리수 : 00
			//1. For 문을 사용해서 객체를 Animal 객체로 뽑아서
			//2. 다운캐스팅해서 자식 필드의 count 읽어서 총 더한 값을 출력
		
		//동물의 총 합을 구하는 변수 선언
		int sum = 0;
		
		for (int i = 0; i < arr1.length; i++) {
			
			//배열에 각 방에 저장된 객체를 Animal 객체에 저장
			Animal aa = arr1[i];
			aa.eat();		//Animal의 eat() 메소드 : 오버라이딩된 메소드 출력
			aa.run();		//Animal의 run() 메소드 : 오버라이딩된 메소드 출력
			
			if (aa instanceof Tiger) {
				Tiger t1 = (Tiger) aa;
				sum += t1.count;		//sum = sum + t1.count
			}
			if (aa instanceof Egle) {
				Egle t1 = (Egle) aa;
				sum += t1.count;		//sum = sum + t1.count
			}
			if (aa instanceof Fish) {
				Fish t1 = (Fish) aa;
				sum += t1.count;		//sum = sum + t1.count
			}
			if (aa instanceof Dog) {
				Dog t1 = (Dog) aa;
				sum += t1.count;		//sum = sum + t1.count
			}
		}
		System.out.println("총 동물의 수는 : " + sum);
		

	}

}
