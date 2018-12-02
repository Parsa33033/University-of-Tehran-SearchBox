package searchengine;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * @author Parsa
 * gets Text from a given url
 */
public class TextAcquisition implements IndexerInterface{
	
	private Document doc;
	
	/**
	 * @param doc
	 * @param url
	 */
	public void getDocument(Document doc, String url) {
		this.doc = doc;
		this.contentRepo.put(url, getTextTags());
	}
	
	/**
	 * gets text from (h1 h2 h3 h4 h5 h6 p a div) tags
	 * uses Jsoup api to Extract tag texts
	 * @return
	 */
	public String getTextTags() {
		StringBuilder str = new StringBuilder();
		Elements elements = doc.select("h1,h2,h3,h4,h5,h6,p,a,h,div");
		for(Element e : elements) { 
			str.append(" "+e.text()+" ");
		}
		String documentText = str.toString();
		return documentText;
	}
}
