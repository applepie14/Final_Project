package jeju.review;

import java.sql.Timestamp;
import java.util.Date;

public class ReviewDTO {
	private int review_no;
	private String user_email;
	private String review_title;
	private String review_content;
	private Timestamp review_date;
	private String review_place;
	private int review_like_count;
	private String user_nickname;
	private String review_img;
	
	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public Timestamp getReview_date() {
		return review_date;
	}

	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}

	public String getReview_place() {
		return review_place;
	}

	public void setReview_place(String review_place) {
		this.review_place = review_place;
	}

	public int getReview_like_count() {
		return review_like_count;
	}

	public void setReview_like_count(int review_like_count) {
		this.review_like_count = review_like_count;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}
	
	public void setUser_nickname(String user_nickname) {
		this.user_nickname=user_nickname;
	}

}
