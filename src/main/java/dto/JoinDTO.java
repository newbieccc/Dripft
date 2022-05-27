package dto;

public class JoinDTO {
	private String m_email, m_password, m_name, m_nickname, m_birth, m_gender, m_tel ,m_joindate;
	private int m_authority, m_no;

	public JoinDTO(){
		
	}
	
	public JoinDTO(String m_email, String m_password, String m_name, String m_nickname, String m_birth, String m_gender, String m_tel) {
		this.m_email = m_email;
		this.m_password = m_password;
		this.m_name = m_name;
		this.m_nickname = m_nickname;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_tel = m_tel;
		
	}
	
	public JoinDTO(String m_email) {
		this.m_email = m_email;
	}
	
	public JoinDTO(String m_name, String m_tel) {
		this.m_name = m_name;
		this.m_tel = m_tel;
	}

	public JoinDTO(String m_email, String m_name, String m_tel, String m_password) {		
		this.m_email = m_email;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_password = m_password;
	}

	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_password() {
		return m_password;
	}
	public void setM_password(String m_password) {
		this.m_password = m_password;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_nickname() {
		return m_nickname;
	}
	public void setM_nickname(String m_nickname) {
		this.m_nickname = m_nickname;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_joindate() {
		return m_joindate;
	}
	public void setM_joindate(String m_joindate) {
		this.m_joindate = m_joindate;
	}
	public int getM_authority() {
		return m_authority;
	}
	public void setM_authority(int m_authority) {
		this.m_authority = m_authority;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	
}
