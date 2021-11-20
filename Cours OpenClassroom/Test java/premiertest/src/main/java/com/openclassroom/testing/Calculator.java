package com.openclassroom.testing;

import java.util.HashSet;
import java.util.Set;

/**
 * Class representing a calculator
 */
public class Calculator {

    /**
     * Add two integers a and b
     * 
     * @param a
     *            int : first integer
     * @param b
     *            int : second integer
     * @return Sum of the two integers
     */
    public int add(int a, int b) {
        return a + b;
    }

    public int multiply(int a, int b) {
        return a * b;
    }

    public Set<Integer> digitSet(int number) {
        String numberString = String.valueOf(number);
        char[] digits = numberString.toCharArray();
        Set<Integer> s = new HashSet<>();
        for (char digit : digits) {
            s.add(Character.getNumericValue(digit));
        }
        return s;
    }

}
