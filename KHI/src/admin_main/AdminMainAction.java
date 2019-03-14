package admin_main;

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

import admin.adminpaging;
import qna.pagingAction;
import qna.qnaVO;
import reserv.DateBean;
import reserv.ReservVO;

public class AdminMainAction extends ActionSupport {

	private static Reader reader;
	private static SqlMapClient sqlMapper;

	private String id;
	private String password;
	
	private List reservList;
	
	private IdVO idvo;
	private Calendar today ;
	
	private DateBean day;
	private int month;
	private Object year;
	private int date;
	
	private int optionNum;
	
	private int currentPage=1;
	
	private int totalCount=0;
	private int blockCount=5;
	private int blockPage=5;
	
	private admin_main.pagingAction page;
	private adminpaging pageQnA;
	private adminpaging pageCM;
	
	private String pagingHtml;

	public AdminMainAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String login() throws SQLException {
		idvo = new IdVO();
		
		idvo.setId(getId());
		idvo.setPassword(getPassword());
		
		Integer login =  (Integer) sqlMapper.queryForObject("selectId",idvo);
		
		if(login == 0)
			return "noLogin";
		
		return SUCCESS;
	}

	public String execute() throws SQLException {
		reservList= new ArrayList<ReservVO>();
		
		today = Calendar.getInstance();

		day = new DateBean();
		month = today.get(Calendar.MONTH);
		year = today.get(Calendar.YEAR);
		date = today.get(Calendar.DATE);

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

			reservList = sqlMapper.queryForList("ReservDay", day);
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		totalCount = reservList.size();
		page = new admin_main.pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		reservList = reservList.subList(page.getStartCount(), lastCount);
		
	
		
		return SUCCESS;
	}
	
	
	public String ReservList() throws SQLException {
		reservList= new ArrayList<ReservVO>();
		
		reservList = sqlMapper.queryForList("ReservAll");
		
		totalCount = reservList.size();
		page = new admin_main.pagingAction();
		page.pagingActionList(currentPage, totalCount, 10, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		reservList = reservList.subList(page.getStartCount(), lastCount);

		return SUCCESS;
	}


	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		sqlMapper = sqlMapper;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public IdVO getIdvo() {
		return idvo;
	}

	public void setIdvo(IdVO idvo) {
		this.idvo = idvo;
	}

	public List getReservList() {
		return reservList;
	}

	public void setReservList(List reservList) {
		this.reservList = reservList;
	}

	public Calendar getToday() {
		return today;
	}

	public void setToday(Calendar today) {
		this.today = today;
	}

	public DateBean getDay() {
		return day;
	}

	public void setDay(DateBean day) {
		this.day = day;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public Object getYear() {
		return year;
	}

	public void setYear(Object year) {
		this.year = year;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public int getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

	public admin_main.pagingAction getPage() {
		return page;
	}

	public void setPage(admin_main.pagingAction page) {
		this.page = page;
	}

	public adminpaging getPageQnA() {
		return pageQnA;
	}

	public void setPageQnA(adminpaging pageQnA) {
		this.pageQnA = pageQnA;
	}

	public adminpaging getPageCM() {
		return pageCM;
	}

	public void setPageCM(adminpaging pageCM) {
		this.pageCM = pageCM;
	}	

}
