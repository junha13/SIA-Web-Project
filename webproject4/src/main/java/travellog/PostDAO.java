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
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO tb_post (postTitle, postLocation, postContent, postStartDay, postEndDay, postThumbnail, userId) VALUES (?, ?, ?, ?, ?, ?, ?)");
		try {
			pstmt.setString(1, post.getPostTitle());
			pstmt.setString(2, post.getPostLocation());
			pstmt.setString(3, post.getPostContent());
			pstmt.setString(4, post.getPostStartDay());
			pstmt.setString(5, post.getPostEndDay());
			pstmt.setString(6, post.getPostThumbnail());
			pstmt.setString(7, post.getUserId());
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
	public List<PostVO> getPostListByLocation(String location) throws Exception {

		// sql문 -> SUBSTRING(postLocation, 1, 2) AS city 으로 서울, 부산, 제주만 추출
		List<PostVO> postList = new ArrayList<PostVO>();
		Connection con = getConnection();
		PreparedStatement psmt = con.prepareStatement(
				"select p.* from tb_post p join tb_regions r on p.postLocation = r.label where r.sidoNameEn = ? order by p.created_at DESC");
		psmt.setObject(1, location);
		ResultSet rs = psmt.executeQuery();

		while (rs.next()) {
			PostVO post = new PostVO();
			post.setPkId(rs.getInt("pkid"));
			post.setPostTitle(rs.getString("postTitle"));
			post.setPostContent(rs.getString("postContent"));
			post.setPostLocation(rs.getString("postLocation"));
			post.setPostStartDay(rs.getString("postStartDay"));
			post.setPostEndDay(rs.getString("postEndDay"));
			post.setPostThumbnail(rs.getString("postThumbnail"));
			post.setUserId(rs.getString("userId"));
			postList.add(post);
		}
		con.close();
		return postList;
	}
	
	public List<PostVO> findAll() throws Exception {
		List<PostVO> postlist = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("select * from tb_post order by created_at DESC");
		ResultSet rs = ps.executeQuery();		
		while (rs.next()) {
			PostVO post = new PostVO();
			post.setPkId(rs.getInt("pkid"));
			post.setPostTitle(rs.getString("postTitle"));
			post.setPostContent(rs.getString("postContent"));
			post.setPostLocation(rs.getString("postLocation"));
			post.setPostStartDay(rs.getString("postStartDay"));
			post.setPostEndDay(rs.getString("postEndDay"));
			post.setPostThumbnail(rs.getString("postThumbnail"));
			post.setUserId(rs.getString("userId"));
			postlist.add(post);
			}
		con.close();
		return postlist;
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
			post.setPostStartDay(rs.getString("postStartDay"));
			post.setPostEndDay(rs.getString("postEndDay"));
			post.setPostThumbnail(rs.getString("postThumbnail"));
			post.setUserId(rs.getString("userId"));
		}
		con.close();
		return post;
	}
	public List<PostVO> getPostListBySearchCondition(String condition, String inputData) throws Exception {
		List<PostVO> postList = new ArrayList<PostVO>();
		Connection con = getConnection();
		PreparedStatement pstmt = con.prepareStatement("select * from tb_post where "+ condition +" like ?");
		pstmt.setString(1, "%"+inputData+"%");
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			PostVO post = new PostVO();
			post.setPkId(rs.getInt("pkid"));
			post.setPostTitle(rs.getString("postTitle"));
			post.setPostContent(rs.getString("postContent"));
			post.setPostLocation(rs.getString("postLocation"));
			post.setCreatedAt(rs.getTimestamp("created_at"));
			post.setPostStartDay(rs.getString("postStartDay"));
			post.setPostEndDay(rs.getString("postEndDay"));
			post.setPostThumbnail(rs.getString("postThumbnail"));
			post.setUserId(rs.getString("userId"));
			postList.add(post);
		}
		con.close();
		return postList;
	}
	
	public List<String> suggestLocationByInputData(String keyword) throws Exception {
		List<String> result = new ArrayList<String>();
		if (keyword == null) {
			return result;
		}
		Connection con = getConnection();
		String sql = "Select label from tb_regions where CONCAT(sidoNameKo, ' ', sggName) like ? or sggName like ? or sidoNameKo like ? order by sidoNameKo, sggName limit 10";
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

	public void updatePostByInputData(PostVO post, int pkId) throws Exception {
		Connection con = getConnection();
		PreparedStatement psmt = con.prepareStatement("update tb_post set postTitle = ?, postLocation = ?, postContent = ?, postStartDay = ?, postEndDay = ?, postThumbnail = ? where pkid = ?");
		try {
			psmt.setString(1, post.getPostTitle());
			psmt.setString(2, post.getPostLocation());
			psmt.setString(3, post.getPostContent());
			psmt.setString(4, post.getPostStartDay());
			psmt.setString(5, post.getPostEndDay());
			psmt.setString(6, post.getPostThumbnail());
			psmt.setInt(7, pkId);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		con.close();
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
	
	public List<String> findAllSido() throws Exception {
		List<String> sidoList = new ArrayList<>();
		Connection con = getConnection();
		PreparedStatement psmt = con.prepareStatement("Select distinct sidoNameKo from tb_regions order by sidoNameKo");
		ResultSet rs = psmt.executeQuery();
		while (rs.next()) {
			sidoList.add(rs.getString("sidoNameKo"));
		}
		con.close();
		return sidoList;
	}
	
	public List<PostVO> getPostsByUserId(String userId) throws Exception {
	    List<PostVO> postList = new ArrayList<PostVO>();
	    Connection con = getConnection();
	    PreparedStatement ps = con.prepareStatement(
	        "SELECT * FROM tb_post WHERE userId = ? ORDER BY created_at DESC"
	    );
	    ps.setString(1, userId);
	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {
	        PostVO post = new PostVO();
	        post.setPkId(rs.getInt("pkid"));
	        post.setPostTitle(rs.getString("postTitle"));
	        post.setPostContent(rs.getString("postContent"));
	        post.setPostLocation(rs.getString("postLocation"));
	        post.setPostStartDay(rs.getString("postStartDay"));
	        post.setPostEndDay(rs.getString("postEndDay"));
	        post.setPostThumbnail(rs.getString("postThumbnail"));
	        post.setUserId(rs.getString("userId"));
	        postList.add(post);
	    }
	    con.close();
	    return postList;
	}
	public void deletePostByPkId(int pkId) throws Exception {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement(
				"delete from tb_post where pkId = ?"
				);
		ps.setInt(1, pkId);
		ps.execute();
		con.close();
	}

	private static Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/webProject");
		Connection connection = dataSource.getConnection();
		return connection;
	}

}
