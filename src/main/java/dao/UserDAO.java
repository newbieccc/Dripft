package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.DBConnection;
import dto.LoginDTO;

public class UserDAO {
	public LoginDTO update(LoginDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE accounts SET m_password=?, m_nickname=?, m_tel=? WHERE m_email=?";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_password());
			pstmt.setString(2, dto.getM_nickname());
			pstmt.setString(3, dto.getM_tel());
			pstmt.setString(4, dto.getM_email());
			pstmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		
		return dto;
	}
	
	
}
