package chapter02.EX03;

public class RangOfVariableUse02 {

	public static void main(String[] args) {
		//변수의 생존 범위
		int value1 = 3;
		if (value1 >1) {
			int value2 =5;
			
			System.out.println(value1);
			System.out.println(value2);
		}

        System.out.println(value1);
        //System.out.println(value2);
		
	}
}
