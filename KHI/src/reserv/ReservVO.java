package reserv;

import java.util.Date;

public class ReservVO {

	private int r_no;
	private Date q_date;
	private String q_dateStr;
	private String r_location;
	private int r_option;
	private String p_name;
	private String p_no;
	private String q_file_orgname;
	private String q_content;
	private String q_tell;
	private int r_ok;

	private int v_num;
	
	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_location() {
		return r_location;
	}

	public void setR_location(String r_location) {
		this.r_location = r_location;
	}

	public int getR_option() {
		return r_option;
	}

	public void setR_option(String r_option) {
		this.r_option = Integer.parseInt(r_option);
	}
	public void setR_option(int r_option) {
		this.r_option = r_option;
	}
	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getQ_file_orgname() {
		return q_file_orgname;
	}

	public void setQ_file_orgname(String q_file_orgname) {
		this.q_file_orgname = q_file_orgname;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_tell() {
		return q_tell;
	}

	public void setQ_tell(String q_tell) {
		this.q_tell = q_tell;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}


	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public int getV_num() {
		return v_num;
	}

	public void setV_num(int v_num) {
		this.v_num = v_num;
	}

	public String getQ_dateStr() {
		return q_dateStr;
	}

	public void setQ_dateStr(String q_dateStr) {
		this.q_dateStr = q_dateStr;
	}

	public int getR_ok() {
		return r_ok;
	}

	public void setR_ok(int r_ok) {
		this.r_ok = r_ok;
	}

}
