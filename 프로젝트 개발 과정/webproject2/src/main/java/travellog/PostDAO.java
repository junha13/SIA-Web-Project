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

public class PostDAO {

	// post-write에서 사용자가 입력한 값 저장 메소드
	public int insertDB(PostVO post) throws Exception {
		int pkid = 0;
		Connection con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO tb_post (postTitle, postLocation, postContent) VALUES (?, ?, ?)");
		try {
			pstmt.setString(1, post.getPostTitle());
			pstmt.setString(2, post.getPostLocation());
			pstmt.setString(3, post.getPostContent());
			pstmt.executeUpdate();
			
			PreparedStatement stmt = con.prepareStatement("SELECT LAST_INSERT_ID()");  // 제일 마지막으로 입력된 거 가져오기
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
			    pkid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.close();
		return pkid;
	}


	// !!! 사용자가 입력한 값 post-list로 불러오는 메소드
	public List<PostVO> getPostByPostId(String location) throws Exception {
		String norm = location == null ? "" : location.trim().toLowerCase();
		String dbLoc = java.util.Map.of("seoul", "서울", "busan", "부산", "jeju", "제주").getOrDefault(norm, location);
		Connection con = getConnection();

		// sql문 -> SUBSTRING(postLocation, 1, 2) AS city 으로 서울, 부산, 제주만 추출
		List<PostVO> list = new ArrayList<PostVO>();
		Connection connection = getConnection();
		PreparedStatement psmt = connection.prepareStatement(
				"select distinct pkid, postTitle, SUBSTRING(postLocation, 1, 2) AS postLocation, postContent from tb_post where SUBSTRING(postLocation, 1, 2) = ?");
		psmt.setObject(1, dbLoc);
		ResultSet rs = psmt.executeQuery();

		while (rs.next()) {
			PostVO post = new PostVO();
			post.pkId = rs.getInt("pkid");
			post.postTitle = rs.getString("postTitle");
			post.postContent = rs.getString("postContent");
			post.postLocation = rs.getString("postLocation");
			list.add(post);
		}
		con.close();
		return list;
	}

	// !!! 사용자가 입력한 값 post-view로 불러오는 메소드
	public PostVO getPostById(int pkId) throws Exception {
		PostVO post = new PostVO();
		Connection con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from tb_post where pkid = ?");
		pstmt.setInt(1, pkId);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			post.setPkId(rs.getInt("pkid"));
			post.setPostTitle(rs.getString("postTitle"));
			post.setPostContent(rs.getString("postContent"));
			post.setPostLocation(rs.getString("postLocation"));
			post.setCreatedAt(rs.getTimestamp("created_at"));
		}
		con.close();
		return post;
	}
	
	public List<String> suggestLocationByInputData(String keyword) throws Exception {
		List<String> result = new ArrayList<String>();
		if (keyword == null) {
			return result;
		}
		Connection con = getConnection();
		String sql = "Select label from tb_regions where CONCAT(sidoName, ' ', sggName) like ? or sggName like ? or sidoName like ? order by sidoName, sggName limit 10";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, keyword + "%");
		psmt.setString(2, keyword + "%");
		psmt.setString(3, keyword + "%");
		ResultSet rs = psmt.executeQuery();  // 쿼리 실행
		while(rs.next()) {
			result.add(rs.getString("label")); // 라벨 컬럼을 가져오는거임
		}
 		con.close();
 		return result;
	}
	
	public boolean locationInputCheck(String locationInput) throws Exception {
		Connection con = getConnection();
		PreparedStatement psmt = con.prepareStatement("Select count(*) as cnt from tb_regions where label = ?");
		psmt.setString(1, locationInput);
		ResultSet rs = psmt.executeQuery();
		while(rs.next()) {
			int checkCount = rs.getInt("cnt");
			if(checkCount==1) {
				return true;
			}
		}
		con.close();
		return false;
	}

	private static Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/webProject");
		Connection connection = dataSource.getConnection();
		return connection;
	}

}
