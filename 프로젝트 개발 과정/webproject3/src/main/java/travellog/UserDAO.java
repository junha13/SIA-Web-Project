package travellog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {

    // 1. 회원가입
    public void insertDB(UserVO user) throws Exception {
        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            connection = getConnection();
            String sql = "INSERT INTO tb_user (loginId, loginPw, loginName, phoneNumber, email, birth) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, user.getLoginId());
            pstmt.setString(2, user.getLoginPw());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getBirth());

            pstmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            closeResources(null, pstmt, connection);
        }
    }

    // 2. 로그인 검증
    public UserVO loginCheck(String loginId, String loginPw) throws Exception {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserVO user = null;

        try {
            connection = getConnection();
            String sql = "SELECT * FROM tb_user WHERE loginId = ? AND loginPw = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, loginId);
            pstmt.setString(2, loginPw);
            rs = pstmt.executeQuery();

            if(rs.next()) {
                user = new UserVO();
                user.setLoginId(rs.getString("loginId"));
                user.setLoginPw(rs.getString("loginPw"));
                user.setName(rs.getString("loginName"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setEmail(rs.getString("email"));
                user.setBirth(rs.getString("birth"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(rs, pstmt, connection);
        }
        return user;
    }

    // 3. 아이디 중복 체크
    public boolean doubleCheckId(String id) throws Exception {
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean isIdExist = false;

        try {
            connection = getConnection();
            String sql = "SELECT COUNT(*) FROM tb_user WHERE loginId = ?";
            pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int count = rs.getInt(1);
                isIdExist = (count > 0);
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            closeResources(rs, pstmt, connection);
        }

        return isIdExist;
    }

    // 4. 회원정보 수정
    public void updateUser(UserVO user) throws Exception {
        Connection connection = null;
        PreparedStatement pstmt = null;

        try {
            connection = getConnection();
            String sql = "UPDATE tb_user SET loginPw=?, loginName=?, phoneNumber=?, email=?, birth=? WHERE loginId=?";
            pstmt = connection.prepareStatement(sql);

            pstmt.setString(1, user.getLoginPw());
            pstmt.setString(2, user.getName());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getBirth());
            pstmt.setString(6, user.getLoginId());

            pstmt.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            closeResources(null, pstmt, connection);
        }
    }

    // DB 연결
    private static Connection getConnection() throws Exception {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) envContext.lookup("jdbc/webProject");
            return dataSource.getConnection();
        } catch(NamingException e) {
            throw new Exception("DataSource lookup 실패", e);
        } catch(SQLException e) {
            throw new Exception("데이터베이스 연결 실패", e);
        }
    }

    // 자원 해제
    private void closeResources(ResultSet rs, PreparedStatement pstmt, Connection connection) {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
