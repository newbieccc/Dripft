package dto;

public class CommentDTO {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_date;
	private int b_like;
	private int b_dislike;
	private int b_viewcount;
	private int b_del;
	private String m_email;
	private int totalcomments;
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_dislike() {
		return b_dislike;
	}
	public void setB_dislike(int b_dislike) {
		this.b_dislike = b_dislike;
	}
	public int getB_viewcount() {
		return b_viewcount;
	}
	public void setB_viewcount(int b_viewcount) {
		this.b_viewcount = b_viewcount;
	}
	public int getB_del() {
		return b_del;
	}
	public void setB_del(int b_del) {
		this.b_del = b_del;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public int getTotalcomments() {
		return totalcomments;
	}
	public void setTotalcomments(int totalcomments) {
		this.totalcomments = totalcomments;
	}
	
	
}
