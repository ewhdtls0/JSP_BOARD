package com.exam.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.exam.dto.bbsDTO;
public class bbsDAO {
	private static bbsDAO bDAO = new bbsDAO();
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private int result = 0;
	
	private bbsDAO() {
		super();
	}

	public static bbsDAO getInstance() {
		return bDAO;
	}
	
	public Connection getConnect() {
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
	/*
	public int nextval() {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("SELECT MAX(bbsId) ").append("FROM bbs");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result = rs.getInt("MAX(bbsId)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return result;
	}
	*/
	public int write(bbsDTO bbsDTO) {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO bbs(title, content, writer)");
		query.append(" VALUES(?, ?, ?)");
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, bbsDTO.getTitle());
			pstmt.setString(2, bbsDTO.getContent());
			pstmt.setString(3, bbsDTO.getWriter());
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
	public List<bbsDTO> selectList(){
		List<bbsDTO> list = new ArrayList<>();
		
		try {
			con = getConnect();
			String sql = "SELECT * FROM bbs ORDER BY bbsId DESC";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				bbsDTO bbsDTO = new bbsDTO();
				bbsDTO.setBbsId(rs.getInt("bbsId"));
				bbsDTO.setTitle(rs.getString("title"));
				bbsDTO.setContent(rs.getString("content"));
				bbsDTO.setWriter(rs.getString("writer"));
				list.add(bbsDTO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return list;
	}
	
	public bbsDTO selectById(String bbsId) {
		bbsDTO bDTO = new bbsDTO();
		con = getConnect();
		String sql = "SELECT * FROM bbs WHERE bbsId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bbsId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bDTO.setBbsId(rs.getInt("bbsId"));
				bDTO.setTitle(rs.getString("title"));
				bDTO.setContent(rs.getString("content"));
				bDTO.setWriter(rs.getString("writer"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, rs);
		}
		return bDTO;
	}
	
	public int deleteById(int bbsId) {
		con = getConnect();
		String sql = "DELETE FROM bbs WHERE bbsId = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bbsId);
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
	public int update(bbsDTO bDTO) {
		con = getConnect();
		StringBuffer query = new StringBuffer();
		query.append("UPDATE bbs SET title = ?, ");
		query.append("content = ? ");
		query.append("WHERE bbsId = ?");
		
		try {
			pstmt = con.prepareStatement(query.toString());
			pstmt.setString(1, bDTO.getTitle());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setInt(3, bDTO.getBbsId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, pstmt, null);
		}
		return result;
	}
	
}
