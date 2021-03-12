package com.exam.dao;

import java.sql.*;
import com.exam.dto.userDTO;

public class userDAO {
	private static userDAO uDAO;
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result;
	
	private userDAO() {}
	
	public static synchronized userDAO getInstance() {
		if (uDAO == null) {
			uDAO = new userDAO();
		}
		return uDAO;
	}
	
	public Connection getConnection() {
		String url = "jdbc:mysql://localhost:3306/jsp";
		String id = "root", pw = "Horkov1!";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	}
	
	public int join(userDTO uDTO) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO user(id, pw)").append(" VALUES (?, ?)");
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1,  uDTO.getId());
			pstmt.setString(2, uDTO.getPw());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con,  pstmt, null);
		}
		
		return result;
	}
	
	public int login(String id, String pw) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("SELECT pw").append(" FROM user").append(" WHERE id = ?");
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					return 1;
				}
				else {
					return 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, pstmt, rs);
		}
		return -1;
	}	
	
	
	
}
