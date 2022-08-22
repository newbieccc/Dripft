package dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private String b_email, b_title, b_content, b_date;
	private int b_no, b_like, b_dislike, b_viewcount;
	
}
