package searchengine;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class StopWords {
	
	public Set<String> stopWords = new HashSet<String>();
	public File stopWordsFile;
	public StopWords() {
		try {			
			stopWordsFile = new File("stopwords.txt");
			BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(stopWordsFile)));
			StringBuilder str = new StringBuilder();
			while(reader.ready()) {
				str.append(" "+reader.readLine()+" ");
			}
			String[] s = str.toString().split("\\s+");
			stopWords = new HashSet<String>();
			List<String> temp = Arrays.asList(s);
			stopWords.addAll(temp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}	
	
	public String filteredString(String term) {
		StringBuilder str = new StringBuilder();
		for(String s: term.split("\\s+")) {
			if(!this.stopWords.contains(s.toLowerCase().trim())) {
				str.append(" "+s+" ");
			}
		}
		return str.toString();
	}
}