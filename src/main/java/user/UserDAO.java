package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/bbs?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
			String user = "root";
			String password = "smart";

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void dbClose() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM user WHERE userID = ? ";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, userID);
			rs = stmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("userPassword").equals(userPassword)) {
					return 1;// 로그인성공
				} else {
					return 0;// 아이디있고 로그인 실패
				}
			} else {
				return -1; // 아이디 없음.
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return -2;// 오류
	}
	public int join(User user) {
		String sql = "insert into user values(?, ?, ?, ?, ?)";
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, user.getUserID());
			stmt.setString(2, user.getUserPassword());
			stmt.setString(3, user.getUserName());
			stmt.setString(4, user.getUserGender());
			stmt.setString(5, user.getUserEmail());
			
			return stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return -1;
	}

}
