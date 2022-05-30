package dao;

import java.sql.*;
import java.util.*;
import dto.*;
import db.DBConnection;

public class mainBoardListDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public List<BoardViewDTO> mainBest() throws Exception {

		String sql = "SELECT * FROM bestBoardView WHERE B_DEL = 0 ORDER BY B_LIKE DESC LIMIT 0, 20"; //추천수가 같으면 날짜순으로 정렬하는거 추가
		List<BoardViewDTO> bBoardList = new ArrayList<BoardViewDTO>();
		
		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			BoardViewDTO dto = new BoardViewDTO();

			dto.setB_no(rs.getInt("b_no"));
			dto.setB_title(rs.getString("b_title"));
			dto.setB_content(rs.getString("b_content"));
			dto.setB_date(rs.getString("b_date"));
			dto.setB_like(rs.getInt("b_like"));
			dto.setB_dislike(rs.getInt("b_dislike"));
			dto.setB_viewcount(rs.getInt("b_viewcount"));
			dto.setB_del(rs.getInt("b_del"));
			dto.setM_nickname(rs.getString("m_nickname"));
			dto.setTotalcomments(rs.getInt("totalcomments"));

			bBoardList.add(dto);
		}

		return bBoardList;
	}

	public List<BoardViewDTO> mainBoard() throws Exception {

		String sql = "SELECT * FROM boardView WHERE B_DEL = 0 AND B_LIKE < 20 ORDER BY B_LIKE DESC LIMIT 0, 10"; //추천수가 같으면 날짜순으로 정렬하는거 추가
		List<BoardViewDTO> bBoardList = new ArrayList<BoardViewDTO>();
		
		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			BoardViewDTO dto = new BoardViewDTO();

			dto.setB_no(rs.getInt("b_no"));
			dto.setB_title(rs.getString("b_title"));
			dto.setB_content(rs.getString("b_content"));
			dto.setB_date(rs.getString("b_date"));
			dto.setB_like(rs.getInt("b_like"));
			dto.setB_dislike(rs.getInt("b_dislike"));
			dto.setB_viewcount(rs.getInt("b_viewcount"));
			dto.setB_del(rs.getInt("b_del"));
			dto.setM_nickname(rs.getString("m_nickname"));
			dto.setTotalcomments(rs.getInt("totalcomments"));

			bBoardList.add(dto);
		}

		return bBoardList;
	}
	
	public List<NoticeViewDTO> mainNotice() throws Exception {
		
		String sql = "SELECT * FROM noticeView WHERE N_DEL = 0 LIMIT 0, 10";
		List<NoticeViewDTO> nBoardList = new ArrayList<NoticeViewDTO>();

		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			NoticeViewDTO dto = new NoticeViewDTO();

			dto.setN_no(rs.getInt("n_no"));
			dto.setN_title(rs.getString("n_title"));
			dto.setN_content(rs.getString("n_content"));
			dto.setN_date(rs.getString("n_date"));
			dto.setN_viewcount(rs.getInt("n_viewcount"));
			dto.setM_nickname(rs.getString("m_nickname"));

			nBoardList.add(dto);
		}

		return nBoardList;
	}
	
//	public void insertBoard() throws ClassNotFoundException, SQLException {
//		String sql = "INSERT INTO board(m_email, b_title, b_content, b_like) VALUES(?,?,?,?)";
//		
//		con = DBConnection.dbconn();
//		pstmt = con.prepareStatement(sql);
//		pstmt.setString(1, "aih0408");	
//		for (int i = 0; i < 100; i++) {
//			pstmt.setString(2, "테스트입니다"+i);
//			pstmt.setString(3, "테스트입니다"+i);
//			pstmt.setInt(4, i);
//			
//			pstmt.executeQuery();
//		}
//	}
}
