import java.util.Scanner;

class Palindrome {
    public static void main(String args[]) {
        String original, reverse = "";
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter string for checking");
        original = scanner.nextLine();
        int length = original.length();
        for (int i = length - 1; i >= 0; i--)
            reverse = reverse + original.charAt(i);
        if (original.equals(reverse))
            System.out.println("String is a palindrome");
        else
            System.out.println("String is not palindrome");
        scanner.close();

    }
}
