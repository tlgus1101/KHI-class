package notice;

import java.util.Date;

public class noticeVO {
	private int n_no;
	private String n_subject;
	private String n_content;
	private String n_file_orgname;
	private int n_readhit;
	private Date n_regdate;
	private String n_file_savname;
	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_file_orgname() {
		return n_file_orgname;
	}
	public void setN_file_orgname(String n_file_orgname) {
		this.n_file_orgname = n_file_orgname;
	}
	public int getN_readhit() {
		return n_readhit;
	}
	public void setN_readhit(int n_readhit) {
		this.n_readhit = n_readhit;
	}
	public Date getN_regdate() {
		return n_regdate;
	}
	public void setN_regdate(Date n_regdate) {
		this.n_regdate = n_regdate;
	}
	public String getN_file_savname() {
		return n_file_savname;
	}
	public void setN_file_savname(String n_file_savname) {
		this.n_file_savname = n_file_savname;
	}


}
