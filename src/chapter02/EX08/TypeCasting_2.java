package chapter02.EX08;

public class TypeCasting_2 {

	public static void main(String[] args) {
		//1. 자동타입 변환 (업캐스팅)
	    float value1 =3;   //int 3이 float 타입으로 자동 업캐스팅
	    long value2 =5;    //int 5가 long 타임으로 자동으로 업캐스팅
        double value3 =7;  //int 7 double 타입으로 자동 업캐스팅
	    
        byte value4 =9;    //예외 int > byte
        short value5 =11;  //예외 > short
		
		//2. 수동타입 변환 (다운캐스팅)
        byte value6 =(byte)128;  //int > byte, -128
        int value7 =(int)3.5;    //double > int
        float value8 =(float)7.5;//double > float
        
        System.out.println(value6);
        System.out.println(value7);
        System.out.println(value8);

	}

}
