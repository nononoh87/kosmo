package chapter06.EX01;

public class Student_Test {

	public static void main(String[] args) {
		//객체 생성은 반드시 main 메소드에서 생성 해야한다.
		
		//같은 패키지 내부의 클래스는 import 없이 바로 호출이 가능
		
		
		//생성자 : 객체를 생성시 필드에 초기값을 할당할때 사용.
		Student Lee = new Student (80,99,70,"Lee");
		Lee.call();
		
		Student Hong = new Student (88,99,77,"Hong");
		Hong.call();
		
		Student Song = new Student (80,60,99,"Song");
		Song.call();
		
		Student Jung = new Student ();
		Jung.call();
		
		
		
		
		
		

	}

}
