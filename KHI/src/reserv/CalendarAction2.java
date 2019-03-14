package reserv;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class CalendarAction2 extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private Calendar today;
	private int year;
	private int month;
	private int date;

	private DateBean day;

	private StringBuffer calendHtml;

	private List<ReservVO> list = new ArrayList<ReservVO>();
	private List<ReservVO> Countlist = new ArrayList<ReservVO>();

	private boolean finish = false;

	public CalendarAction2() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public int totalDays(int month, int year) {

		int[] tempDay = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

		if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0))
			tempDay[1] = 29;
		else
			tempDay[1] = 28;

		return tempDay[month];
	}

	public String DayList() throws SQLException {

		today = Calendar.getInstance();
		
		day = new DateBean();

		if (getMonth() == 0 && getYear() == 0) {
			month = today.get(Calendar.MONTH);
		} else if (getMonth() > 11) {
			year = year + 1;
			month = 0;
		} else if (getMonth() < 0) {
			year = year - 1;
			month = 11;
		}

		if (getYear() == 0)
			year = today.get(Calendar.YEAR);
		if (getDate() == 0) {
			date = today.get(Calendar.DATE);
		}

		day.setDate(1);
		day.setMonth(0);
		day.setYear(0);

		Date day2;
		Date day3;
		try {
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			day2 = dateFormat.parse(year + "-" + (month + 1) + "-" + (date));
			day3 = dateFormat.parse(year + "-" + (month + 1) + "-" + (date + 1));
			day.setFirstday(new Date(day2.getTime()));
			day.setEndday(new Date(day3.getTime()));

			list = sqlMapper.queryForList("ReservOkDay", day);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String execute() throws SQLException, ParseException {

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); ;
		today = Calendar.getInstance();
		day = new DateBean();

		if (getMonth() == 0 && getYear() == 0) {
			month = today.get(Calendar.MONTH);
		} else if (getMonth() > 11) {
			year = year + 1;
			month = 0;
		} else if (getMonth() < 0) {
			year = year - 1;
			month = 11;
		}

		if (getYear() == 0)
			year = today.get(Calendar.YEAR);
		if (getDate() == 0) {
			date = today.get(Calendar.DATE);
		}

		day.setDate(1);
		day.setMonth(0);
		day.setYear(0);

		Date day2;
		Date day3;
		
		

		today = Calendar.getInstance();
		int nowMonth = today.get(Calendar.MONTH) + 1;
		int nowYear = today.get(Calendar.YEAR);
		int nowDate = today.get(Calendar.DATE);

		Date D_day = dateFormat.parse(nowYear + "-" + nowMonth + "-" + nowDate);
		
		try {
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			day2 = dateFormat.parse(year + "-" + (month + 1) + "-" + (date));
			day3 = dateFormat.parse(year + "-" + (month + 1) + "-" + (date + 1));
			day.setFirstday(new Date(day2.getTime()));
			day.setEndday(new Date(day3.getTime()));

			list = sqlMapper.queryForList("ReservDay", day);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		calendHtml = new StringBuffer();

		Date firstOfMonth = new Date(year, month, 1);
		int firstDay = firstOfMonth.getDay();
		int lastDate = totalDays(month, year);

		//calendHtml.append("<![CDATA[ ");
		calendHtml.append(" <br> <TABLE BORDER=2 BORDERCOLOR=gray style='BORDER-COLLAPSE:collapse'>");
		calendHtml.append("<th bgcolor='#013e97' height='30'  colspan=7><font color='#ffffff'><a style='color:black' href='/_KHI/CalendarAction.action?year=" + year
				+ "&month=" + (month - 1) + "&date=" + date + "'> < </a> &nbsp;" + year + "년" + (month + 1) + "월"
				+ "<a style='color:black' href='/_KHI/CalendarAction.action?year=" + year + "&month=" + (month + 1)
				+ "&date=" + date + "'> > </a></font></th>");
		calendHtml.append("<tr align ='center' valign='center'>");
		calendHtml.append("<td width=70><font color=red><b>SUN</b></font></td>");
		calendHtml.append("<td width=70><b>MON</b></td>");
		calendHtml.append("<td width=70><b>TUE</b></td>");
		calendHtml.append("<td width=70><b>WED</b></td>");
		calendHtml.append("<td width=70><b>THU</b></td>");
		calendHtml.append("<td width=70><b>FRI</b></td>");
		calendHtml.append("<td width=70><font color=blue><b>SAT</b></td></font></td>");
		calendHtml.append("</tr>");

		int dayNum = 1;
		int curCol = 1;

		double c = Math.ceil((lastDate + firstDay) / 7);
		if (Math.ceil((lastDate + firstDay) % 7) != 0)
			c += 1;
		for (double i = 1; i <= c; i++) {
			calendHtml.append("<tr align = 'left' valign='top' height=60>");

			for (int j = 1; j <= 7; j++) {
				int tempCount = 0;

				try {
					day2 = dateFormat.parse(year + "-" + (month + 1) + "-" + (1));
					day3 = dateFormat.parse(year + "-" + (month + 2) + "-" + 1);
					Date day4 = dateFormat.parse(year + "-" + (month + 1) + "-" + (dayNum));

					day.setFirstday(new Date(day2.getTime()));
					day.setEndday(new Date(day3.getTime()));

					Countlist = sqlMapper.queryForList("ReservAll_count_str", day);

					if (D_day.getTime() >= day4.getTime()) {
						for (int  cList= 0;  cList< Countlist.size(); cList++) {
							if(Countlist.get(cList).getQ_date().getTime()==day4.getTime() && Countlist.get(cList).getR_ok() == 1 )
							{
								tempCount++;
							}
						}
					} else
					{
						for (int  cList= 0;  cList< Countlist.size(); cList++) {
							if(Countlist.get(cList).getQ_date().getTime()==day4.getTime() )
							{
								tempCount++;
							}
						}
					}
						
					
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				String count = "";
				if (tempCount != 0) {
					count = "<img src='./image/location1.png' width='10' height='10'>" + tempCount + "개의 예약";
				}

				if (dayNum > lastDate) {
					dayNum = 0;
					finish = true;
				}

				if (curCol < firstDay + 1) {
					calendHtml.append("<TD ></TD>");
					curCol++;
				} else {
					if (dayNum == 0) {
						calendHtml.append("<td></td>");
					} else {

						if (dayNum == date)
							calendHtml.append(
									"<td  align = 'left' valign='top'style='background: skyblue;'><font size=2px>");

						else
							calendHtml.append("<td><font  size=2px>");
						String  url = "'/_KHI/CalendarAction.action?year=";

						Date count_day = dateFormat.parse(year + "-" + (month + 1) + "-" + dayNum);
						
						if (D_day.getTime() < count_day.getTime() )
						{
							url="'/_KHI/yh/CminiwriteForm.action?year=";
						}
						switch (j) {
						case 1:
							calendHtml.append("<a style='color:black' name="+dayNum +" href="+url + year
									+ "&month=" + month + "&date=" + dayNum + " '>" + dayNum + "</a><br><br>" + count
									+ "  </font></td>");
							break;
						case 7:
							calendHtml.append("<a style='color:black' name="+dayNum +" href="+url + year
									+ "&month=" + month + "&date=" + dayNum + "'>" + dayNum + "</a><br><br>" + count
									+ " </font></td>");
							break;

						default:
							calendHtml.append("<a style='color:black' name="+dayNum +" href="+url + year
									+ "&month=" + month + "&date=" + dayNum + "'>" + dayNum + "</a><br><br>" + count
									+ " </td>");
						}

					}
				
					if (finish == false)
						dayNum++;
				}
			}
			calendHtml.append("</tr>");
		}
		calendHtml.append("<table>");
		
		System.out.println(calendHtml.toString());
		//calendHtml.append(" ]]>");
		DayList();

		return SUCCESS;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public StringBuffer getCalendHtml() {
		return calendHtml;
	}

	public void setCalendHtml(StringBuffer calendHtml) {
		this.calendHtml = calendHtml;
	}

	public boolean isFinish() {
		return finish;
	}

	public void setFinish(boolean finish) {
		this.finish = finish;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CalendarAction2.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CalendarAction2.sqlMapper = sqlMapper;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public List<ReservVO> getList() {
		return list;
	}

	public void setList(List<ReservVO> list) {
		this.list = list;
	}

	public DateBean getDay() {
		return day;
	}

	public void setDay(DateBean day) {
		this.day = day;
	}

}