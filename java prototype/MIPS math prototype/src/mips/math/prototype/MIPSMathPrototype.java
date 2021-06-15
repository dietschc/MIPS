package mips.math.prototype;
import java.util.Scanner;

public class MIPSMathPrototype {
    
    public static int answer;

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
      
    public static void main(String[] args) {
        int min = 0;  
        int max = 20;
        int operatorMin = 0;  
        int operatorMax = 4;
        
        int x = (int)(Math.random()*(max-min+1)+min);
        int y = (int)(Math.random()*(max-min+1)+min);
        int operator = (int)(Math.random()*(operatorMax-operatorMin)+operatorMin);
        
        // Setup input
        Scanner scan = new Scanner(System.in);
        
        int guess;
        
        System.out.println("X " + x);
        System.out.println("Y " + y);
        System.out.println("Operator " + operator);
        
        
        // begin main
        System.out.println("Hello, welcome to MathQuiz, here is your first problem:");
        
        switch (operator) {
            case 0 -> {
                answer = add(x, y);
                System.out.println("What is " + x + " + " + y + "?");
                System.out.println("Addition: " + answer);
            }
            case 1 -> {
                answer = sub(x, y);
                System.out.println("What is " + x + " - " + y + "?");
                System.out.println("Subtraction: " + answer);
            }
            case 2 -> {
                answer = mult(x, y);
                System.out.println("What is " + x + " * " + y + "?");
                System.out.println("Multiplication: " + answer);
            }
            case 3 -> {
                answer = modu(x, y);
                System.out.println("What is " + x + " % " + y + "?");
                System.out.println("Modulus: " + answer);
            }
            default -> {
                System.out.println("Error, something has gone wrong.");
            }
        }
        
        guess = scan.nextInt();
        
        if (guess == answer) {
            System.out.println("Correct!");
        } else {
            System.out.println("Incorrect!");
        }
        
    }
    
}
