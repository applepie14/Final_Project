package jeju.plan;
import java.util.Date;
public class PlanDTO {
	
	private int plan_no;
	private String user_email;
	private String plan_title;
	private String plan_content;
	private int plan_count;
	private Date plan_startdate;
	private String plan_period;
	private String plan_gender;
	private String plan_theme;
	private int plan_date;
	private String plan_save;
	private String plan_public;
	private int plan_like_count;
	private String user_nickname;
	//private int plantag_tagno;
	//private int plantag_planno;
	//private String tag_tag;
	
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public String getPlan_content() {
		return plan_content;
	}
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}
	
	public int getPlan_count() {
		return plan_count;
	}
	public void setPlan_count(int plan_count) {
		this.plan_count = plan_count;
	}

	public Date getPlan_startdate() {
		return plan_startdate;
	}
	public void setPlan_startdate(Date plan_startdate) {
		this.plan_startdate = plan_startdate;
	}
	public String getPlan_period() {
		return plan_period;
	}
	public void setPlan_period(String plan_period) {
		this.plan_period = plan_period;
	}
	public String getPlan_gender() {
		return plan_gender;
	}
	public void setPlan_gender(String plan_gender) {
		this.plan_gender = plan_gender;
	}
	public String getPlan_theme() {
		return plan_theme;
	}
	public void setPlan_theme(String plan_theme) {
		this.plan_theme = plan_theme;
	}
	public int getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(int  plan_date) {
		this.plan_date = plan_date;
	}

	public String getPlan_save() {
		return plan_save;
	}
	public void setPlan_save(String plan_save) {
		this.plan_save = plan_save;
	}
	public String getPlan_public() {
		return plan_public;
	}
	public void setPlan_public(String plan_public) {
		this.plan_public = plan_public;
	}
	public int getPlan_like_count() {
		return plan_like_count;
	}
	public void setPlan_like_count(int plan_like_count) {
		this.plan_like_count = plan_like_count;
	}
/*
	public int getPlantag_tagno() {
		return plantag_tagno;
	}
	public void setPlantag_tagno(int plantag_tagno) {
		this.plantag_tagno = plantag_tagno;
	}
	public int getPlantag_planno() {
		return plantag_planno;
	}
	public void setPlantag_planno(int plantag_planno) {
		this.plantag_planno = plantag_planno;
	}
	public String getTag_tag() {
		return tag_tag;
	}
	public void setTag_tag(String tag_tag) {
		this.tag_tag = tag_tag;
	}
*/	
	
}
