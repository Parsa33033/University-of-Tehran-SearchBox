package searchengine;

public class Main{
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		EngineThreadFactory engine = new EngineThreadFactory(10);
		engine.run();
//		Main m = new Main();
//		System.out.println(m.filterString("my name is parsa and i want university"));
	}	
	
	StopWords stopWords = new StopWords();
	PorterStemmer stemmer = new PorterStemmer();
	public String filterString(String s) {
		s = s.toLowerCase();
		s = s.replaceAll("(\\.+)|(\\,+)|(\\=+)|(\\-+)|(\\_+)|(\\>+)|(\\<+)", "");
		s = stopWords.filteredString(s);
		s = stemString(s);
		return s;
	}
	
	/**
	 * uses Porter Stemmer to Stem string s
	 * @param s
	 * @return
	 */
	public String stemString(String s) {
		s = s.toLowerCase();
		String[] str = s.split("\\s+");
		StringBuilder sb = new StringBuilder();
		for(int i = 0 ; i<str.length ; i++) {
			System.out.println(stemmer.stem(str[i].trim()));
			sb.append(" "+stemmer.stem(str[i])+" ");
		}
		return sb.toString();
	}
	
}
