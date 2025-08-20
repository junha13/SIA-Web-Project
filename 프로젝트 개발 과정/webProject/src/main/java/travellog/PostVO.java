package travellog;

public class PostVO {
	int postPkId;
	String postTitle;
	String postContent;
	String postLocation;
	public int getPostPkId() {
		return postPkId;
	}
	public void setPostPkId(int postPkId) {
		this.postPkId = postPkId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostLocation() {
		return postLocation;
	}
	public void setPostLocation(String postLocation) {
		this.postLocation = postLocation;
	}
	
	@Override
	public String toString() {
		return "PostVO [postPkId=" + postPkId + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postLocation=" + postLocation + "]";
	}
	
}
