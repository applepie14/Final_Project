package jeju.review;

public class ReviewLikeDTO {
	private int rlike_no;
	private int review_no;
	private String user_email;

	public int getRlike_no() {
		return rlike_no;
	}

	public void setRlike_no(int rlike_no) {
		this.rlike_no = rlike_no;
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

}
