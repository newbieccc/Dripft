package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import dto.*;

public class BoardDAO {
	public List<BoardViewDTO> boardList(int b_no) {
		List<BoardViewDTO> list = new ArrayList<BoardViewDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM boardView WHERE B_LIKE < 20 AND B_DEL = 0 ORDER BY b_no desc LIMIT ?, 10";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardViewDTO dto = new BoardViewDTO();
				dto.setB_no(rs.getInt("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_like(rs.getInt("b_like"));
				dto.setB_viewcount(rs.getInt("b_viewcount"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_dislike(rs.getInt("b_dislike"));
				dto.setM_nickname(rs.getString("m_nickname"));
				dto.setTotalcount(rs.getInt("totalcount"));
				dto.setTotalcomments(rs.getInt("totalcomments"));
				
				list.add(dto);

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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public BoardViewDTO boardDetail(int b_no) throws Exception {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM boardView where B_NO = ?";
		BoardViewDTO dto = new BoardViewDTO();

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			dto.setB_no(rs.getInt("b_no"));
			dto.setB_title(rs.getString("b_title"));
			dto.setB_content(rs.getString("b_content"));
			dto.setB_date(rs.getString("b_date"));
			dto.setB_like(rs.getInt("b_like"));
			dto.setB_dislike(rs.getInt("b_dislike"));
			dto.setB_viewcount(rs.getInt("b_viewcount"));
			dto.setM_nickname(rs.getString("m_nickname"));
			dto.setTotalcomments(rs.getInt("totalcomments"));
		}
		return dto;
	}

	public int BoardChange(BoardDTO dto) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Update board SET b_title = ?, b_content = ? WHERE b_no = ?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getB_title());
			pstmt.setString(2, dto.getB_content());
			pstmt.setInt(3, dto.getB_no());
			int Update_result = pstmt.executeUpdate();
			return Update_result;
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			return -1;
		}

	}

	public int BoardDelete(int b_no) throws ClassNotFoundException, SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Update board SET b_del = 1 WHERE b_no = ?";

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);

		return pstmt.executeUpdate();
	}

	public int BoardViewIncrease(int b_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "Update board SET b_viewcount = b_viewcount + 1 WHERE b_no = ?";
		int result = 0;
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {

			e.printStackTrace();
		}

		return result;
	}

	// session(로그인중인 사람)의 m_email속성(s_email)과 게시글 번호(b_no)를 넣어 작성자가 일치하면 1, 일치하지 않으면
	// 0을 반환
	public int BoardWriterCheck(String s_email, int b_no) throws ClassNotFoundException, SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT m_email FROM board where B_NO = ?";

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);
		rs = pstmt.executeQuery();

		rs.next();
		if (rs.getString("m_email").equals(s_email)) {

			return 1;
		} else {
			return 0;
		}
	}

	public int BoardLike(int b_no, String ip) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO boardlikeoverlap(b_no, ipv4) VALUES(?,?)";
		int result = 0;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.setString(2, ip);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {

			return -1;
		}

		return result;

	}

	public void BoardLikeUp(int b_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET B_LIKE = B_LIKE + 1 WHERE B_NO = ?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	public int BoardDisLike(int b_no, String ip) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO boarddislikeoverlap(b_no, ipv4) VALUES(?,?)";
		int result = 0;

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.setString(2, ip);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (Exception e) {

			return -1;
		}

		return result;

	}

	public void BoardDisLikeUp(int b_no) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE board SET B_DISLIKE = B_DISLIKE + 1 WHERE B_NO = ?";

		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<BoardViewDTO> bestBoardList(int b_no) {
		List<BoardViewDTO> list = new ArrayList<BoardViewDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT * FROM bestBoardView WHERE B_LIKE >= 20 AND B_DEL = 0 ORDER BY b_no desc LIMIT ?, 10";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardViewDTO dto = new BoardViewDTO();
				dto.setB_no(rs.getInt("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_like(rs.getInt("b_like"));
				dto.setB_viewcount(rs.getInt("b_viewcount"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_dislike(rs.getInt("b_dislike"));
				dto.setM_nickname(rs.getString("m_nickname"));
				dto.setTotalcount(rs.getInt("totalcount"));
				dto.setTotalcomments(rs.getInt("totalcomments"));
				
				list.add(dto);

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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

}
