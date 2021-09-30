package translator;

import java.util.Arrays;
import java.util.List;

public class Translator {

	/**
	 * @param sentence
	 *            The sentence to translate.
	 */
	public static void main(String[] sentence) {
		EngToFrench translator = new EngToFrench();
		List<String> translation = translator.translate(Arrays.asList(sentence));
		String text = String.join(" ", translation);
		System.out.println(text);
	}

}
