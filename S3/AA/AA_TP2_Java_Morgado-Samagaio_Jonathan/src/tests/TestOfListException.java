package tests;

import static org.junit.Assert.fail;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import utils.MapUtils;

public class TestOfListException {

	@Test
	public void testTooFewColumns() {
		List<String> input = Arrays.asList("lol_mdr");
		Map<String, String> dict;
		try {
			dict = MapUtils.ofPairList(input);
		} catch (IllegalArgumentException e) {
			return;
		}
		fail("Expecting IllegalArgumentException, got: " + dict);
	}

	@Test
	public void testTooMuchColumns() {
		List<String> input = Arrays.asList("lol:mdr:kikou");
		Map<String, String> dict;
		try {
			dict = MapUtils.ofPairList(input);
		} catch (IllegalArgumentException e) {
			return;
		}
		fail("Expecting IllegalArgumentException, got: " + dict);
	}

}
