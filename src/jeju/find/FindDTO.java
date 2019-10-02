package jeju.find;

import java.util.Date;

public class FindDTO {
	private int company_no;
	private String user_email;
	private String company_title;
	private String company_content;
	private int company_count;
	private Date company_startdate;
	private Date company_enddate;
	private String company_gender;
	private String company_theme;
	private Date company_date;
	private String user_nickname;
	
	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getCompany_title() {
		return company_title;
	}

	public void setCompany_title(String company_title) {
		this.company_title = company_title;
	}

	public String getCompany_content() {
		return company_content;
	}

	public void setCompany_content(String company_content) {
		this.company_content = company_content;
	}

	public int getCompany_count() {
		return company_count;
	}

	public void setCompany_count(int company_count) {
		this.company_count = company_count;
	}

	public Date getCompany_startdate() {
		return company_startdate;
	}

	public void setCompany_startdate(Date company_startdate) {
		this.company_startdate = company_startdate;
	}

	public Date getCompany_enddate() {
		return company_enddate;
	}

	public void setCompany_enddate(Date company_enddate) {
		this.company_enddate = company_enddate;
	}

	public String getCompany_gender() {
		return company_gender;
	}

	public void setCompany_gender(String company_gender) {
		this.company_gender = company_gender;
	}

	public String getCompany_theme() {
		return company_theme;
	}

	public void setCompany_theme(String company_theme) {
		this.company_theme = company_theme;
	}

	public Date getCompany_date() {
		return company_date;
	}

	public void setCompany_date(Date company_date) {
		this.company_date = company_date;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}
	
	public void setUser_nickname(String user_nickname) {
		this.user_nickname=user_nickname;
	}

}
