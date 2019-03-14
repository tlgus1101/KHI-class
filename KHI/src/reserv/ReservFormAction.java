package reserv;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;
import qna.qnaVO;

public class ReservFormAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private StringBuffer productsHtml;
	private List<ProductsVO> list = new ArrayList<ProductsVO>();

	
	private int r_no;
	private String q_dateStr;
	private Date q_date;
	private String r_location;
	private String r_option;
	private String p_name;
	private String p_no;
	private String q_file_orgname;
	private String q_content;
	private String q_tell;
	private int r_ok;

	private String name;
	private String count;
	private int size;
	
	private int q_num;
	
	private int r_List ;
	
	public List<ReservVO> reservVO;
	public qnaVO qnavo;

	public ReservFormAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String execute() throws SQLException {
		productsHtml = new StringBuffer();
		qnavo = new qnaVO();

//		if(getP_name()!=null)
//		{
//			ReservSave();
//		}
		if (q_num != 0) {
			qnavo = (qnaVO) sqlMapper.queryForObject("yh.selectOne", q_num);
			setQ_dateStr(qnavo.getQ_date());
			setQ_tell("010-" + qnavo.getQ_phone1() + "-" + qnavo.getQ_phone2());
			setQ_file_orgname(qnavo.getFile_orgname());
			setQ_content(qnavo.getQ_content());
		}
		list = sqlMapper.queryForList("products.p_selectOption1");

		
		productsHtml.append("<select name='p_no'>");
		for (int i = 0; i < list.size(); i++) {
			productsHtml
					.append("<option value='" + list.get(i).getP_no() + "'>" + list.get(i).getP_name() + "</option>");
		}
		productsHtml.append("</select>");
		

		return SUCCESS;
	}
	
	public String ReservSave() throws SQLException, ParseException {
		
		ReservVO reservVO = new ReservVO();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String[] date  = q_dateStr.split("-");
		//q_date = dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]);
		
		
		String [] temp_name= getP_name().split(",");
		String [] temp_no= getP_no().split(",");
		
		setP_name("");
		setP_no("");
		
		for(int i=0;i < temp_name.length;i++)
		{
			if(temp_name[i] != null)
			{
				p_name += temp_name[i]+",";
				p_no += temp_no[i]+",";
			}
		}
		
		//reservVO.setR_no(getR_no());
		reservVO.setQ_date(dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]));
		reservVO.setR_location(getR_location());
		reservVO.setR_option(getR_option()+"");
		reservVO.setP_name(getP_name());
		reservVO.setP_no(getP_no());
		reservVO.setQ_file_orgname(getQ_file_orgname());
		reservVO.setQ_content( getQ_content());
		reservVO.setQ_tell(getQ_tell());
		
	
		sqlMapper.insert("reserv_insert",reservVO);

		return SUCCESS;

	}

	
	public String ReservModify() throws SQLException {
		productsHtml = new StringBuffer();
		reservVO = new ArrayList<ReservVO>();

		reservVO = sqlMapper.queryForList("ReservView", getR_no());
		if (reservVO.get(0).getP_name() != "") {
			String[] p_nameList = reservVO.get(0).getP_name().split(",");
			setSize(p_nameList.length);
		}
		
//		String[] p_no = reservVO.get(0).getP_no().split(",");
//		
//		setName("");
//		setCount("");
//		for (int i = 0; i < p_nameList.length; i++) {
//			setName(getName()+" "+p_nameList[i]);
//			setCount(getName()+" "+p_no[i]);
//		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		setR_no(reservVO.get(0).getR_no());
		String[] datList = reservVO.get(0).getQ_dateStr().split(" ");
		setQ_dateStr(datList[0]);
		setQ_date(reservVO.get(0).getQ_date());
		setR_location(reservVO.get(0).getR_location());
		setR_option(reservVO.get(0).getR_option() + "");
		setP_name(reservVO.get(0).getP_name());
		setP_no(reservVO.get(0).getP_no());
		setQ_file_orgname(reservVO.get(0).getQ_file_orgname());
		setQ_content(reservVO.get(0).getQ_content());
		setQ_tell(reservVO.get(0).getQ_tell());

		setName(reservVO.get(0).getP_name());
		setCount(reservVO.get(0).getP_no());
	
		list = sqlMapper.queryForList("products.p_selectOption1");

		productsHtml.append("<select name='p_no'>");
		for (int i = 0; i < list.size(); i++) {
			productsHtml.append(
					"<option value='" + list.get(i).getP_no() + "'>"+ list.get(i).getP_name() + "</option>");
		}
		productsHtml.append("</select>");

		return SUCCESS;
	}

	public String ReservUpdate() throws SQLException, ParseException {

		ReservVO reservVO = new ReservVO();

		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String[] date = q_dateStr.split("-");
		// q_date = dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]);

		
		String [] temp_name= getP_name().split(",");
		String [] temp_no= getP_no().split(",");
		
		setP_name("");
		setP_no("");
		
		for(int i=0;i < temp_name.length;i++)
		{
			if(temp_name[i] != null)
			{
				p_name += temp_name[i]+",";
				p_no += temp_no[i]+",";
			}
		}
		
		reservVO.setR_no(getR_no());
		reservVO.setQ_date(dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]));
		reservVO.setR_location(getR_location());
		reservVO.setR_option(getR_option() + "");
		reservVO.setP_name(getP_name());
		reservVO.setP_no(getP_no());
		reservVO.setQ_file_orgname(getQ_file_orgname());
		reservVO.setQ_content(getQ_content());
		reservVO.setQ_tell(getQ_tell());
		
		System.out.println(getQ_tell());
		sqlMapper.update("reserv_update", reservVO);

		return SUCCESS;
	}

	
	public String ReservDelete() throws SQLException {

		System.out.println(getR_no()+"getR_no()");
		sqlMapper.delete("reserv_delete", getR_no());
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ReservFormAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ReservFormAction.sqlMapper = sqlMapper;
	}

	public StringBuffer getProductsHtml() {
		return productsHtml;
	}

	public void setProductsHtml(StringBuffer productsHtml) {
		this.productsHtml = productsHtml;
	}

	public List<ProductsVO> getList() {
		return list;
	}

	public void setList(List<ProductsVO> list) {
		this.list = list;
	}

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

	public String getR_option() {
		return r_option;
	}

	public void setR_option(String r_option) {
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

	public String getQ_dateStr() {
		return q_dateStr;
	}

	public void setQ_dateStr(String q_dateStr) {
		this.q_dateStr = q_dateStr;
	}

	public Date getQ_date() {
		return q_date;
	}

	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<ReservVO> getReservVO() {
		return reservVO;
	}

	public void setReservVO(List<ReservVO> reservVO) {
		this.reservVO = reservVO;
	}

	public int getR_List() {
		return r_List;
	}

	public void setR_List(int r_List) {
		this.r_List = r_List;
	}

	public int getR_ok() {
		return r_ok;
	}

	public void setR_ok(int r_ok) {
		this.r_ok = r_ok;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public qnaVO getQnavo() {
		return qnavo;
	}

	public void setQnavo(qnaVO qnavo) {
		this.qnavo = qnavo;
	}

}
