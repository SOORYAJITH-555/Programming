
import java.io.*;
public class FileEg {

	public static void main(String[] args)throws IOException, FileNotFoundException {
		try {
			FileInputStream r=new FileInputStream("sample1.txt");
			FileOutputStream o=new FileOutputStream("sample2.txt");
			int i;
			while((i=r.read())!=-1) {
				o.write(i);
			}
			System.out.println("File copied successfully");
			r.close();o.close();
		}
		catch(FileNotFoundException a) {
			System.out.println("File not Found"+a.getMessage());
		}
		catch(IOException e) {
			System.out.println("Error in file opening"+e.getMessage());
		}
	}
}
