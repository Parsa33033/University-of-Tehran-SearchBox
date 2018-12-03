package src;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.Singleton;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import searchengine.EngineThreadFactory;
import searchengine.Query;

@Singleton
public class SearchBean {
	String s = "parsa";
	int i = 0;
	
//	List<String> l = new ArrayList<String>();
	Map<String, Double> l = new HashMap<String, Double>();
	Map<String, String> content = new HashMap<String, String>();
	Map<String, String> titles = new HashMap<String, String>();
	EngineThreadFactory engine = new EngineThreadFactory(10);
	Query query = new Query();
	public SearchBean() {
		new Thread(new Runnable() {
			public void run(){
				engine.run();
			}
		}).start();
		
	}
	public void setS(String s) {
		if(s==null) {
			s = "Search";
		}
		this.l = query.run(s);
		this.content = query.getContent();
		this.titles = query.getTitle();
//		l.put(s, 1.0);
	}
	
	public Map<String, Double> getS() {
		return this.l;
	}
	
	public Map<String, String> getContent(){
		return this.content;
	}
	
	public Map<String, String> getTitle(){
		return this.titles;
	}
	
	public Map<String , Map<String, String>> getInfo(){
		Map<String, Map<String, String>> map = new HashMap<String, Map<String, String>>();
		Document doc = null;
		for(Map.Entry<String, Double> i: this.l.entrySet()) {
			try {
				URL url = new URL(i.getKey());
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				doc = Jsoup.parse(con.getContent().toString());
				Map<String, String> m = new HashMap<String, String>();
				m.put(doc.select("title").get(0).text(), doc.select("h1,h2,h3,h4").get(0).text());
				map.put(i.getKey(), m);
			}catch(Exception e) {
				
			}
		}
		return map;
	}
	
	
}
