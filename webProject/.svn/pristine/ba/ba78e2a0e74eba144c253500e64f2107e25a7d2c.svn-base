package travellog;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {
	Connection connection;
	
	int userPkId;
	String loginId;
	String loginPw;
	String name;
	String phoneNumber;
	String email;
	String birth;
	
	public void insertDB(UserVO user) throws Exception {
		connection = getConnection();
		PreparedStatement pstmt = connection.prepareStatement("");
		// user,AB_NAME,ab_email,ab_comdept,ab_birth,ab_tel,ab_memo) "
		try {
			pstmt.setString(1, user.getLoginId());
			pstmt.setString(2, user.getLoginPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getPhoneNumber());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getBirth());
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private static Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/webProject");
		Connection connection = dataSource.getConnection();
		return connection;
	}
	
}
