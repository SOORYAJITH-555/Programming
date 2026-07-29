import java.util.Scanner;

public class Int {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Read the first integer
        System.out.print("Enter first integer: ");
        System.out.print("Enter second integer: ");
        int num1 = scanner.nextInt();

        // Consume the newline character left by nextInt()
        //scanner.nextLine(); // Clears the buffer

        // Read the second integer
        
        int num2 = scanner.nextInt();

        // Display the integers
        System.out.println("First integer: " + num1);
        System.out.println("Second integer: " + num2);

        scanner.close();
    }
}
