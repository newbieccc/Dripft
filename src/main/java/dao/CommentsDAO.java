package dao;

import java.sql.*;
import java.util.*;

import db.DBConnection;
import dto.CommentDTO;
import dto.CommentViewDTO;

public class CommentsDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<CommentViewDTO> commentsList(int b_no, String s_email) throws Exception {

		String sql = "SELECT * FROM commentsView WHERE C_DEL = 0 AND B_NO = ?";
		List<CommentViewDTO> list = new ArrayList<CommentViewDTO>();

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			CommentViewDTO dto = new CommentViewDTO();

			dto.setC_no(rs.getInt("c_no"));
			dto.setC_content(rs.getString("c_content"));
			dto.setC_date(rs.getString("c_date"));
			dto.setC_like(rs.getInt("c_like"));
			dto.setC_dislike(rs.getInt("c_dislike"));
			dto.setM_nickname(rs.getString("m_nickname"));
			if (CommentWriterCheck(dto.getC_no(), s_email) == 1) {
				dto.setWriterCheck(1);
			} else {
				dto.setWriterCheck(0);
			}

			list.add(dto);
		}

		return list;
	}

	public void commentWrite(CommentDTO dto) {

		String sql = "INSERT INTO comments(b_no, m_email, c_content) VALUE(?,?,?)";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getB_no());
			pstmt.setString(2, dto.getM_email());
			pstmt.setString(3, dto.getC_content());
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int CommentWriterCheck(int c_no, String s_email) throws ClassNotFoundException, SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT m_email FROM comments where C_NO = ?";

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, c_no);
		rs = pstmt.executeQuery();

		rs.next();
		if (rs.getString("m_email").equals(s_email)) {

			return 1;
		} else {
			return 0;
		}
	}

	public int CommentLike(int c_no, String ip) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO commentlikeoverlap(c_no, ipv4) VALUES(?,?)";
		int result = 0;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.setString(2, ip);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {

			return -1;
		}

		return result;
	}

	public void CommentLikeUp(int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE comments SET C_LIKE = C_LIKE + 1 WHERE C_NO = ?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int CommentDislike(int c_no, String s_email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO commentdislikeoverlap(c_no, m_email) VALUES(?,?)";
		int result = 0;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.setString(2, s_email);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {

			return -1;
		}

		return result;
	}

	public void CommentDislikeUp(int c_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE comments SET C_DISLIKE = C_DISLIKE + 1 WHERE C_NO = ?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int CommentUpdate(int c_no, String c_content) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE comments SET C_CONTENT = ? WHERE C_NO = ?";
		int result = 0;
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c_content);
			pstmt.setInt(2, c_no);
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public int CommentDelete(int c_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE comments SET C_DEL = 1 WHERE C_NO = ?";
		int result = 0;
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c_no);
			result = pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}
