package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBConnection;

public class ReportDAO {

	public int reportBoard(int b_no, String s_email, String rb_reason) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "INSERT INTO reportedboard(b_no, m_email, rb_reason) VALUES(?,?,?)";
		
		
		try {
			if(boardReporterCheck(b_no, s_email) == 0) {
				
				con = DBConnection.dbconn();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, b_no);
				pstmt.setString(2, s_email);
				pstmt.setString(3, rb_reason);
				
				result = pstmt.executeUpdate();
			}else {
				
				return 0;
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int boardReporterCheck(int b_no, String m_email) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "SELECT COUNT(*) AS count FROM reportedboard WHERE B_NO = ? AND M_EMAIL = ?";
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.setString(2, m_email);
			rs = pstmt.executeQuery();
			rs.next();
			
			result  = rs.getInt("count");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
