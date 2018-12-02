package searchengine;

import java.util.Map;

public class TFIDF {
	
	public double tf(Map<String, Integer> doc, String term) {
		if(doc.containsKey(term)) {
			return (double)((double)doc.get(term)/doc.size());
		}
		return 0;
	}
	
	public double idf(Map<String, Map<String, Integer>> docs, String term) {
		int n = 0;
		for(Map.Entry<String, Map<String, Integer>> m : docs.entrySet()) {
			if(m.getValue().containsKey(term.toLowerCase())) {
				n++;
			}
		}
		return Math.log((double)docs.size()/n);
	}
	
	public Double tfidf(Map<String, Map<String, Integer>> docs, String term, String url) {
		return tf(docs.get(url), term) * idf(docs, term);
	}

}
