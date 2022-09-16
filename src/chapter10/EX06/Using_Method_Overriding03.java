package chapter10.EX06;

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
	@Override
	void run() {
		System.out.println("호랑이가 달립니다.");
	}
	void eat() {
		System.out.println("호랑이가 고기를 먹습니다.");
	}
}
class Egle extends Animal{
	@Override
	void run() {
		System.out.println("독수리는 날라다닙니다.");
	}
	void eat() {
		System.out.println("독수리가 고기를 먹습니다.");
	}
	
}
class Fish extends Animal{
	@Override
	void run() {
		System.out.println("물고기는 헤엄을 칩니다.");
	}
	void eat() {
		System.out.println("물고기는 해조류를 먹습니다.");
	}
}
class Dog extends Animal{
	@Override
	void run() {
		System.out.println("강아지는 신나게 뛰어다닙니다.");
	}
	void eat() {
		System.out.println("강아지는 고기를 먹습니다.");
	}
}

public class Using_Method_Overriding03 {

	public static void main(String[] args) {
		//1. 객체 생성 (Animal 타입으로 생성)
		Animal a1 = new Animal();
		Animal a2 = new Tiger();
		Animal a3 = new Egle();
		Animal a4 = new Fish();
		Animal a5 = new Dog();
		
		//Animal의 메소드 호출
		a1.eat();
		a1.run();
		a2.eat();
		a2.run();
		a3.eat();
		a3.run();
		a4.eat();
		a4.run();
		
		//배열애 객체를 저장 : Animal 객체를 배열에 저장
		Animal [] arr1 = new Animal[] {a1,a2,a3,a4,a5};
		
		//For 문을 사용해서 배열의 내용을 출력
		System.out.println("==for 문을 사용해서 출력==");
		for (int i = 0; i< arr1.length; i++) {
			Animal aa1 = arr1[i];
			aa1.run();			//Animal의 메소드 호출
			aa1.eat();			//Animal의 메소드 호출
		}
		//Enhanced for문을 사용해서 출력
		System.out.println("==Enhanced for를 사용해서 출력==");
		for(Animal k : arr1) {
			k.eat();			//Animal의 메소드 : 오버라이딩된 메소드가 출력 
			k.run();			//Animal의 메소드 : 오버라이딩된 메소드가 출력
		}
		
	}

}
