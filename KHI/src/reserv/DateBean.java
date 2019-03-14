package reserv;

import java.util.Date;

public class DateBean {

	private int date;
	private int month;
	private int year;
	private Date firstday;
	private Date endday;

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}


	public Date getFirstday() {
		return firstday;
	}

	public void setFirstday(Date firstday) {
		this.firstday = firstday;
	}

	public Date getEndday() {
		return endday;
	}

	public void setEndday(Date endday) {
		this.endday = endday;
	}

}
