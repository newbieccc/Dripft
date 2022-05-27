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
	public List<BoardDTO> boardList(int b_no){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM boardview LIMIT ?, 10";
		
		try {
			con = DBConnection.dbconn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setB_no(rs.getInt("b_no"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_date(rs.getString("b_date"));
				dto.setB_like(rs.getInt("b_like"));
				dto.setB_viewcount(rs.getInt("b_viewcount"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_dislike(rs.getInt("b_dislike"));
				dto.setB_email(rs.getString("b_email"));
				
				list.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
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
		rs.next();
		dto.setB_no(rs.getInt("b_no"));
		dto.setB_title(rs.getString("b_title"));
		dto.setB_content(rs.getString("b_content"));
		dto.setB_date(rs.getString("b_date"));
		dto.setB_like(rs.getInt("b_like"));
		dto.setB_dislike(rs.getInt("b_dislike"));
		dto.setB_viewcount(rs.getInt("b_viewcount"));
		dto.setM_nickname(rs.getString("m_nickname"));
		dto.setTotalcomments(rs.getInt("totalcomments"));
		
		return dto;
	}
	
}
