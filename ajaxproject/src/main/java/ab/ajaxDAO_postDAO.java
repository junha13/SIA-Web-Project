package ab;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ajaxDAO_postDAO {

	public List<String> suggestLocationByInputData(String keyword) throws Exception {
		List<String> result = new ArrayList<String>();
		if (keyword == null) {
			return result;
		}

		Connection con = getConnection();
		String sql = "Select Concat(sidoName, ' ', sggName) as label from tb_regions where sggName like ? or sidoName like ? order by sidoName, sggName limit 10";
		PreparedStatement psmt = con.prepareStatement(sql);
		
		psmt.setString(1, keyword + "%");
		psmt.setString(2, keyword + "%");
		ResultSet rs = psmt.executeQuery();  // 쿼리 실행
		while(rs.next()) {
			result.add(rs.getString("label")); // 라벨 컬럼을 가져오는거임
		}
 		con.close();
 		return result;
	}
	private static Connection getConnection() throws Exception {
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/webProject");  // 오류나면 이거 먼저 확인하기
		Connection connection = dataSource.getConnection();
		return connection;
	}

}
