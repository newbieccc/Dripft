package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBConnection;
import dto.JoinDTO;

public class JoinDAO {

	// 동혁이형
	public int join(JoinDTO dto) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO accounts(m_email, m_password, m_name, m_nickname, m_birth, m_gender, m_tel) VALUE(?, ?, ?, ?, ?, ?, ?)";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_email());
			pstmt.setString(2, dto.getM_password());
			pstmt.setString(3, dto.getM_name());
			pstmt.setString(4, dto.getM_nickname());
			pstmt.setString(5, dto.getM_birth());
			pstmt.setString(6, dto.getM_gender());
			pstmt.setString(7, dto.getM_tel());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int emailCheck(String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM accounts WHERE m_email=?";
		int result = 1;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1); // 중복
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public int nickCheck(String nickname) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM accounts WHERE m_nickname = ?";
		int result = 1;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}

	// 승준이형
	public void accountDel(JoinDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM account WHERE m_email=?;";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_email());
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public JoinDTO userInfo(JoinDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM accounts WHERE m_email=?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_email());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				dto.setM_email(rs.getString("m_email"));
				dto.setM_password(rs.getString("m_password"));
				dto.setM_name(rs.getString("m_name"));
				dto.setM_nickname(rs.getString("m_nickname"));
				dto.setM_birth(rs.getString("m_birth"));
				dto.setM_gender(rs.getString("m_gender"));
				dto.setM_tel(rs.getString("m_tel"));
				dto.setM_authority(rs.getInt("m_authority"));
				dto.setM_joindate(rs.getString("m_joindate"));
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return dto;
	}

	public int idCheck(String m_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM accounts WHERE m_email=?";
		int result = 1; 
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
				System.out.println("결과는 : " + result + "개가 나왔습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}		
		return result;
	}
	
	public void update(JoinDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE accounts SET m_nickname=? WHERE m_email=?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_nickname());
			pstmt.setString(2, dto.getM_email());
			pstmt.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	public String idFind(JoinDTO dto) {
		String m_email = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT m_email FROM accounts WHERE m_name=? AND m_tel=?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_name());
			pstmt.setString(2, dto.getM_tel());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				m_email = rs.getString("m_email");
				System.out.println(rs + "ㅋㅋ");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m_email;
	}
}
