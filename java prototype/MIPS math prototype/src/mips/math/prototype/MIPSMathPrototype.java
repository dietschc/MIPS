package mips.math.prototype;
import java.util.Scanner;

// Cole Dietsch
// Week 6/7 Assignment Prototype
// CSC310 Computer Architecute and Operating Systems
// Professor Amitava Karmaker

public class MIPSMathPrototype {
    
    public static int answer;
    public static int correct;
    public static int incorrect;
    public static int total;

    public static int add(int x, int y) {
        return x + y;
    }
    
    public static int sub(int x, int y) {
        return x - y;
    }
    
    public static int mult(int x, int y) {
        return x * y;
    }
    
    public static int modu(int x, int y) {
        return x % y;
    }
    
    public static float calculatePercent(float a, float b) {
        if (b == 0) {
            return 0;
        } else {
            return (a / b)*100;
        }
    }
    
    public static void main(String[] args) {
        int min = 0;  
        int max = 20;
        int operatorMin = 0;  
        int operatorMax = 4;
        boolean notDone = true;
        int guess;
        
        // Setup input
        Scanner scan = new Scanner(System.in);
        
        // Display welcome banner
        System.out.println("Hello, welcome to MathQuiz, here is your first problem:");
        
        // Main loop
        while (notDone) {

            // Initialize variables for each loop
            int x = (int)(Math.random()*(max-min+1)+min);
            int y = (int)(Math.random()*(max-min+1)+min);
            int operator = (int)(Math.random()*(operatorMax-operatorMin)+operatorMin);
            
            /* Debug code
            System.out.println("X " + x);
            System.out.println("Y " + y);
            System.out.println("Operator " + operator);
            */

            switch (operator) {
                case 0 -> {
                    answer = add(x, y);
                    System.out.print("What is " + x + " + " + y + "? ");
                //    System.out.println("Addition: " + answer);
                }
                case 1 -> {
                    answer = sub(x, y);
                    System.out.print("What is " + x + " - " + y + "? ");
                //    System.out.println("Subtraction: " + answer);
                }
                case 2 -> {
                    answer = mult(x, y);
                    System.out.print("What is " + x + " * " + y + "? ");
                //    System.out.println("Multiplication: " + answer);
                }
                case 3 -> {
                    answer = modu(x, y);
                    System.out.print("What is " + x + " % " + y + "? ");
                //    System.out.println("Modulus: " + answer);
                }
                default -> {
                    System.out.println("Error, something has gone wrong.");
                }
            }

            // Take input in for guess
            guess = scan.nextInt();
            
            // Check answer
            if (guess == -1) {
                System.out.println("You solved " + (correct + incorrect) + " math problems and "
                        + "got " + correct + " correct and " + incorrect + " incorrect,"
                                + " for a score of " + (int)calculatePercent(correct, total) + "%.");
                System.out.println("Thanks for playing!");
                notDone = false;
            } else if (guess == answer) {
                System.out.println("Correct!");
                correct++;
            } else {
                System.out.println("Incorrect!");
                incorrect++;
            }
            
            // Increment total
            total++;
        
        } // end while
        
    } // end main
    
} // end class
