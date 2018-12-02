package src;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.Singleton;

import searchengine.EngineThreadFactory;
import searchengine.Query;

@Singleton
public class SearchBean {
	String s = "parsa";
	int i = 0;
	
//	List<String> l = new ArrayList<String>();
	Map<String, Double> l = new HashMap<String, Double>();
	
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
		l = query.run(s);
//		l.put(s, 1.0);
	}
	public Map<String, Double> getS() {
		return this.l;
	}
}
