package gallery;

public class Gallery{
	private int ID;
	private String title;
	private String testLink;
	private String imgLink;
	
	public int getID() {
		return ID;
	}
	public String getTitle() {
		return title;
	}
	public String getTestLink() {
		return testLink;
	}
	public String getImgLink() {
		return imgLink;
	}
	
	public void setID(int ID) {
		this.ID = ID;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setTestLink(String testLink) {
		this.testLink = testLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}
}