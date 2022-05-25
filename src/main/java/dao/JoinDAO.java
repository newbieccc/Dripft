package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import dto.JoinDTO;

public class JoinDAO {
	public int join(JoinDTO dto) {
		
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO account (m_email, m_password, m_name, m_nickname, m_tel)" 
				+ "VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getBirth());
			pstmt.setString(6, dto.getGender());
			pstmt.setString(7, dto.getTel());
			pstmt.setInt(8, dto.getAuthority());
			pstmt.setString(9, dto.getJoindate());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int idCheck(String id) {
	 Connection con = null;
	 PreparedStatement pstmt = null;
	 ResultSet rs = null;
	 String sql = "SELECT COUNT(*) FROM account WHERE m_email=?";
	 int result = 1;
	 
	 try {
		 con = DBConnection.dbconn();
		 pstmt = con.prepareStatement(sql);
		 pstmt.setString(1, id);
		 rs = pstmt.executeQuery();
		 if (rs.next()) {
			result = rs.getInt(1);
		}
	} catch (Exception e) {
	}
	 return result;
	}
}
