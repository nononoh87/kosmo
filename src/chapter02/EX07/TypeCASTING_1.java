package chapter02.EX07;

public class TypeCASTING_1 {

	public static void main(String[] args) {
		//1. 캐스팅 방법
		// - 캐스팅 방법 1 (데이터 타입을 명시)
		int value1 = (int)5.3;  // 5
		long value2 = (long)10;        // int 10이 long 타입으로 자동으로 업캐스팅
		float value3 = (float)5.8;     // double 5.8을  float타입으로 다운캐스팅
		double value4 = (double)16;    // int 16을  double 형으로 업캐스팅
		
		System.out.println(value1);
		System.out.println(value2);
		System.out.println(value3);
		System.out.println(value4);
		
		// - 캐스팅 방법 2 (L, F)
        // 정수는 리터럴 이 기본이 int, 실수는 리터럴 이 기본이 double
		long value5 =10L;
        long value6 = 10l;
        float value7 = 5.8F;
        float value8 =5.8f;
        System.out.println(value5);
        System.out.println(value6);
        System.out.println(value7);
        System.out.println(value8);
        
	}

}
