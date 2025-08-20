package travellog;

public class UserVO {
	int userPkId;
	String loginId;
	String loginPw;
	String name;
	String phoneNumber;
	String email;
	String birth;
	
	public int getUserPkId() {
		return userPkId;
	}
	public void setUserPkId(int userPkId) {
		this.userPkId = userPkId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getLoginPw() {
		return loginPw;
	}
	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "UserVO [userPkId=" + userPkId + ", loginId=" + loginId + ", loginPw=" + loginPw + ", name=" + name
				+ ", phoneNumber=" + phoneNumber + ", email=" + email + ", birth=" + birth + "]";
	}
}