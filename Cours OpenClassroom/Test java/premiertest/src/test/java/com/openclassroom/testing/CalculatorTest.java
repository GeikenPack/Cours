package com.openclassroom.testing;

import static org.assertj.core.api.Assertions.assertThat;

import java.text.MessageFormat;
import java.time.Duration;
import java.time.Instant;
import java.util.Set;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.junit.jupiter.params.provider.ValueSource;


@DisplayName("Réalisation des calculs de bases")
public class CalculatorTest 
{
    private static Instant startedAt;
    private Calculator calculator;

    @BeforeAll
    public static void initStartedTime()
    {
        startedAt = Instant.now();
    }

    @BeforeEach
    void initCalculator()
    {
        calculator = new Calculator();
    }

    
    @DisplayName("Set de tests d'ajout de deux nombres positifs")
    @ParameterizedTest(name = "{0} + {1} doit être égal à {2}")
    @CsvSource({"1,1,2", "5,9,14", "80, 80, 160"})
    void testAddTwoPositiveNumbers(int arg1, int arg2, int expectedResult)
    {
        int result = calculator.add(arg1, arg2);

        assertThat(result).isEqualTo(expectedResult);
    }

    
    @DisplayName("Set de tests de multiplication de deux nombres positifs")
    @ParameterizedTest(name = "{0} * {1} doit être égal à {2}")
    @CsvSource({"1,1,1", "4,8,32", "100,10,1000"})
    void testMultiplyTwoPositiveNumbers(int arg1, int arg2, int expectedResult)
    {
        int result = calculator.multiply(arg1, arg2);

        assertThat(result).isEqualTo(expectedResult);
    }

    
    @DisplayName("Set de tests de multiplication par 0")
    @ParameterizedTest(name = "{0} x 0 doit etre égal à 0")
    @ValueSource(ints = {1, 2, 42, 1011, 5089})
    void testMultiplyByZero(int args)
    {
        int result = calculator.multiply(args, 0);

        assertThat(result).isZero();
    }

    
    @DisplayName("Soit un nombre 95897, l'ensemble correspondant a ce nombre est : {9,5,8,7}")
    @Test
    void testDigitSet()
    {
        int number = 95897;

        Set<Integer> actualDigits = calculator.digitSet(number);

        assertThat(actualDigits).containsExactlyInAnyOrder(5, 7, 8, 9);
    }

    @AfterEach
    void undefCalculator()
    {
        calculator = null;
    }

    @AfterAll
    public static void showTestDuration()
    {
        Instant endedAt = Instant.now();
        long duration = Duration.between(startedAt, endedAt).toMillis();
        System.out.println(MessageFormat.format("Durée des tests : {0} ms", duration));
    }
}
