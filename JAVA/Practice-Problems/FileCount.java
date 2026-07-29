
import java.io.*;
public class FileCount {

	public static void main(String[] args) {
		String filePath="/home/cs-ai-02/Soorya/cycle/src/Cycle2/file1.txt";
		try(BufferedReader br =new BufferedReader(new FileReader(filePath))) {
			int  lc=0,wc=0,cc=0;
			String str;
			while ((str=br.readLine())!=null) {
				lc++;
				cc +=str.replace(" ","").length();
				if(!str.trim().isEmpty()) {
					wc +=str.trim().split("\\s+").length;
				}
			}
			System.out.println("Line Count= "+lc);
			System.out.println("Word Count= "+wc);
			System.out.println("Character Count= "+cc);
		}
		catch(IOException e){
			System.out.println("An error occured"+e.getMessage());
		}
	}
}

