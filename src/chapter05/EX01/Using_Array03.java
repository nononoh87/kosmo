package chapter05.EX01;

import java.util.Arrays;

public class Using_Array03 {

	public static void main(String[] args) {
		// 한국을 빛낸 5명의 위인들만 s String 배열에 저장후 4가지로 출력
		
		String[] a = new String[5];
		
		a[0] = "이순신";
	    a[1] = "정약용";
	    a[2] = "안중근";
	    a[3] = "유관순";
	    a[4] = "세종대왕";
		
	    
	    
	    System.out.println(a[0]);
	    
	    System.out.println("===============================");
	    for (int i= 0; i < a.length; i++) {
        	System.out.println(a[i]);
        }
	    System.out.println("===============================");
	    
	    for (String k : a) {
			System.out.println(k);
		}
	    
	    System.out.println("===============================");
	    
		System.out.println(Arrays.toString(a));
		}

}
