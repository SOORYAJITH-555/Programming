
import java.util.*;

public class IntegerSum {

	public static void main(String[] args) {
		Scanner sc =new Scanner(System.in);
		String str;
		int sum=0;
		System.out.println("Enter the intergers one by one:\n");
		str=sc.nextLine();
		StringTokenizer stn=new StringTokenizer(str);
		while(stn.hasMoreElements()) {
			String stg = stn.nextToken();
			int num=Integer.parseInt(stg);
			System.out.println(num);
			sum+=num;
		}
		System.out.println(sum);
		sc.close();
	}

}
