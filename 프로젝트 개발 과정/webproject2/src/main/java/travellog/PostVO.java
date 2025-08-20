package travellog;

public class PostVO {
	int pkId;
	String postTitle;
	String postContent;
	String postLocation;
	
	// 시간뜨게
	java.sql.Timestamp createdAt;
	
	public int getPkId() {
		return pkId;
	}
	public void setPkId(int pkId) {
		this.pkId = pkId;
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
	
	// 시간뜨게
	public java.sql.Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(java.sql.Timestamp createdAt) { this.createdAt = createdAt; }
	
	@Override
	public String toString() {
		return "PostVO [pkid=" + pkId + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postLocation=" + postLocation + ", createAt" + createdAt + "]";
	}
	
}
