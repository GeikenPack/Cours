package tp1.tests;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import tp1.StrLen;

public class TestTruncate {

	@Test
	public void Test() {
		List<String> input = Arrays.asList("a", "bb","ccc","dddd","eeeee");
		StrLen.truncate(input,3);
		List<String> expected = Arrays.asList("a","bb","ccc","ddd","eee");
		assertEquals(expected, input);
	}
	
}
