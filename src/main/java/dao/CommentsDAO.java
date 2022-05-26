package dao;

import java.sql.*;
import java.util.*;

import db.DBConnection;
import dto.CommentDTO;


public class CommentsDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public List<CommentDTO> commentsList(int b_no) throws ClassNotFoundException, SQLException{
		
		String sql = "SELECT * FROM commentsView WHERE C_DEL = 0 AND B_NO = ?";
		CommentDTO dto = new CommentDTO();
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		
		con = DBConnection.dbconn();
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, b_no);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
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
}
