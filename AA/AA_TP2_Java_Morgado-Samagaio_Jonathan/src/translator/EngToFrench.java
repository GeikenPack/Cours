package translator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class EngToFrench {
	
	protected Map<String, Word> dict;
	
	public void register(String english, String french, Nature nature) {
		dict.put(english, new Word(french, nature));
	}
	
	public void register(String english, String french) {
		dict.put(english, new Word(french));
	}
	
	public EngToFrench() {
		dict = new TreeMap<String, Word>();
		register("I", "je");
		register("you", "tu");
		register("am", "suis");
		register("love", "aimer", Nature.VERB);
		register("easy", "facile", Nature.ADJ);
		register("exercise", "exercice", Nature.NOUN);
	}

	public List<String> translate(List<String> sentence) {
		// TODO: project
		List<Word> l = new ArrayList<Word>();
		for (String e : sentence)
		{
			if (dict.containsKey(e))
			{
				l.add(dict.get(e));
			}
			else
			{
				l.add(new Word(e));
			}
		}
		
		for (int i = 0; i < l.size()-1; i++)
		{
			if (l.get(i).nature == Nature.ADJ && l.get(i+1).nature == Nature.NOUN)
			{
				Collections.swap(l, i, i+1);
			}
		}
		
		List<String> ls = new ArrayList<String>();
		for(int i = 0; i < l.size(); i++)
		{
			ls.add(l.get(i).text);
		}
		return ls;
	}
}
