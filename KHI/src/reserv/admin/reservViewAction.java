package reserv.admin;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import reserv.ReservVO;

public class reservViewAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;

	public StringBuffer productsHtml;

	public int r_no;
	public Date q_date;
	public String q_dateStr;
	public String r_location;
	public int r_option;
	public String p_name;
	public String p_no;
	public String q_file_orgname;
	public String q_content;
	public String q_tell;
	
	public List<ReservVO> reservVO;

	public reservViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws SQLException {

		return SUCCESS;
	}
	
	public String reservView() throws SQLException {

		reservVO = new ArrayList<ReservVO>();

		reservVO = sqlMapper.queryForList("ReservView", getR_no());

		if(reservVO.get(0).getP_name()!=null)
		{
			String[] p_nameList = reservVO.get(0).getP_name().split(",");
			String[] p_no = reservVO.get(0).getP_no().split(",");
			productsHtml = new StringBuffer();
			for (int i = 0; i < p_nameList.length; i++) {
				productsHtml.append(p_nameList[i] + " - " + p_no[i] + "개 <br>");
			}
		}

		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		reservViewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		reservViewAction.sqlMapper = sqlMapper;
	}

	public StringBuffer getProductsHtml() {
		return productsHtml;
	}

	public void setProductsHtml(StringBuffer productsHtml) {
		this.productsHtml = productsHtml;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getQ_dateStr() {
		return q_dateStr;
	}

	public void setQ_dateStr(String q_dateStr) {
		this.q_dateStr = q_dateStr;
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

	public void setR_option(int r_option) {
		this.r_option = r_option;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
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

	public List<ReservVO> getReservVO() {
		return reservVO;
	}

	public void setReservVO(List<ReservVO> reservVO) {
		this.reservVO = reservVO;
	}


}
