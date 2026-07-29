import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<String> cars = new ArrayList<String>();

        System.out.println("Enter car names along with the index (type 'done' to finish):");

        while (true) {
            System.out.print("Enter car name (or 'done' to finish): ");
            String car = scanner.nextLine();

            if (car.equalsIgnoreCase("done")) { // Stop taking input when user types "done"
                break;
            }

            System.out.print("Enter index to insert the car at: ");
            int index = scanner.nextInt();
            scanner.nextLine(); // Clear the newline character left by nextInt()

            // Insert the car name at the specified index
            if (index >= 0 && index <= cars.size()) {
                cars.add(index, car);
            } else {
                System.out.println("Invalid index. Car not added.");
            }
        }

        Collections.sort(cars); // Sort the list

        System.out.println("\nSorted car list:");
        for (String car : cars) {
            System.out.println(car); // Print each car in the sorted list
        }

        scanner.close(); // Close the scanner to avoid resource leak
    }
}
