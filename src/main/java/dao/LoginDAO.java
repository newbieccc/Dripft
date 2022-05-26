package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import dto.LoginDTO;

public class LoginDAO {
	public LoginDTO login(LoginDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) as count, m_nickname FROM accounts WHERE m_email=? AND m_password=? ";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_email());
			pstmt.setString(2, dto.getM_password());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setM_nickname(rs.getString("m_nickname"));
				dto.setCount(rs.getInt("count"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e2) {
			}
		}
		return dto;
	}
}
