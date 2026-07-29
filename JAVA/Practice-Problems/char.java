import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    System.out.println("enter the string:");
    String x = scanner.nextLine();

    int v = x.length();
    int count = 0;

    System.out.println("enter frequency of character:");
    char key = scanner.next().charAt(0);

    for (int i = 0; i < v; i++)
      if (x.charAt(i) == key) {
        count++;
      }

    System.out.println("The frequency is " + count);
    
    scanner.close();
  }
}
