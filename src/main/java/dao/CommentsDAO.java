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
	
	public List<CommentViewDTO> commentsList(int b_no) throws Exception{
		
		String sql = "SELECT * FROM commentsView WHERE C_DEL = 0 AND B_NO = ?";
		List<CommentViewDTO> list = new ArrayList<CommentViewDTO>();
		
		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CommentViewDTO dto = new CommentViewDTO();
			
			dto.setC_no(rs.getInt("c_no"));
			dto.setC_content(rs.getString("c_content"));
			dto.setC_date(rs.getString("c_date"));
			dto.setC_like(rs.getInt("c_like"));
			dto.setC_dislike(rs.getInt("c_dislike"));
			dto.setM_nickname(rs.getString("m_nickname"));
			
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
}
