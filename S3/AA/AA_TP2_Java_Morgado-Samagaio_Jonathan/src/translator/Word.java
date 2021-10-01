package translator;

public class Word {
	
	public final String text;
	public final Nature nature;
	
	public Word(String text) {
		this.text = text;
		this.nature = Nature.OTHER;
	}
	
	public Word(String text, Nature nature) {
		this.text = text;
		this.nature = nature;
	}
}
