package dto;

public class CommentViewDTO {

	private int c_no;
	private int b_no;
	private String c_content;
	private String c_date;
	private int c_like;
	private int c_dislike;
	private int c_del;
	private String m_nickname;
	private int writerCheck;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_like() {
		return c_like;
	}
	public void setC_like(int c_like) {
		this.c_like = c_like;
	}
	public int getC_dislike() {
		return c_dislike;
	}
	public void setC_dislike(int c_dislike) {
		this.c_dislike = c_dislike;
	}
	public int getC_del() {
		return c_del;
	}
	public void setC_del(int c_del) {
		this.c_del = c_del;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public int getWriterCheck() {
		return writerCheck;
	}
	public void setWriterCheck(int writerCheck) {
		this.writerCheck = writerCheck;
	}
	
	
}
