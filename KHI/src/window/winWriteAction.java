package window;
import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;
import reserv.ReservVO;
import window.windowVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;


public class winWriteAction extends ActionSupport{
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private windowVO paramClass;
	private windowVO resultClass;
	
	private int currentPage;
	
	private int r_no;
	private String q_dateStr;
	
	private int v_num;
	private String v_location;
	private String v_content;
	private int v_option;
	private Date v_date;
	private String v_image; //���ε� ������ �����̸�
	private String v_imagesv;
	Calendar today = Calendar.getInstance(); //��¥
	
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Java\\App\\KHI\\WebContent\\images\\";


	private List<ReservVO> reservVO;
	
	public winWriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); 
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		reader.close();
	}

	public String form() throws Exception {
		if (r_no != 0) {
			reservVO = new ArrayList<ReservVO>();
			reservVO = sqlMapper.queryForList("ReservView", getR_no());
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String[] datList = reservVO.get(0).getQ_dateStr().split(" ");
			setQ_dateStr(datList[0]);
			setV_location(reservVO.get(0).getR_location());
			setV_option(reservVO.get(0).getR_option());
			setV_date(reservVO.get(0).getQ_date());
			setV_num(reservVO.get(0).getV_num());
			System.out.println(getV_num());
		}
		return SUCCESS;
	}
	
	public String execute() throws Exception {
		paramClass = new windowVO();
		resultClass = new windowVO();

		sqlMapper.update("reservOK_update", getV_num());

		ReservVO revo = new ReservVO();
		reservVO = sqlMapper.queryForList("Reserv_ProductsList", getV_num());
		System.out.println(getV_num() + "ㄴㅁㅇㄹㄴㅇㄹ");
		if (v_num != 0) {
			paramClass.setV_num(getV_num());
			System.out.println(reservVO.size());
			ProductsVO productsVO = new ProductsVO();
			// 사용한 제품 이름 나열 된거
			if (reservVO.get(0).getP_name() != null) {
				String[] name = reservVO.get(0).getP_name().split(",");
				System.out.println(name.length);
				// 사용한 제품 개수 나열 된거
				String[] count = reservVO.get(0).getP_no().split(",");
				for (int i = 0; i < name.length; i++) {
					productsVO.setP_name(name[i]);
					productsVO.setP_quan(Integer.parseInt(count[i]));
					sqlMapper.update("products.de-quan", productsVO);
					sqlMapper.update("products.p_quanZero", productsVO);
				}
			}
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String[] date = q_dateStr.split("-");
		// q_date = dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]);

		// reservVO.setR_no(getR_no());

		
		// ����� �׸�
		paramClass.setV_location(getV_location());
		paramClass.setV_content(getV_content());
		paramClass.setV_option(getV_option());
		paramClass.setV_date(dateFormat.parse(date[0] + "-" + date[1] + "-" + date[2]));
		// paramClass.setV_date(today.getTime());
		// ���� ����

		if(v_num != 0)
			sqlMapper.insert("insertWindow2", paramClass);
		else
			sqlMapper.insert("insertWindow", paramClass);
	
		if(getUpload() != null) {
			//����� ���� ��ȣ
			
					if(v_num != 0)
						resultClass = (windowVO) sqlMapper.queryForObject("windowOne", getV_num());
						
					else
						resultClass = (windowVO) sqlMapper.queryForObject("windowLastNo");
								//���� ������� Object�޼ҵ� ���.
			String file_name = "file_" + resultClass.getV_num(); //���������� ����� �����̸��� Ȯ���� ���� �� ���� �ϴ� ������ �̸� �ߺ��ȵǰ�
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1, getUploadFileName().length());
			 // .�ڿ� �ִ� �� �� ������ �Ѹ���� Ȯ����
			
			//������ ���� ����.
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			//���� ���� �Ķ���� ����.
			paramClass.setV_num(resultClass.getV_num());
			paramClass.setV_image(getUploadFileName());
			paramClass.setV_imagesv(file_name + "." + file_ext);
			//�������� ������Ʈ.
			sqlMapper.update("updateImageFile", paramClass);
		}
			return SUCCESS;
		}
		
	public windowVO getParamClass() {
		return paramClass;
	}
	public void setParamClass(windowVO paramClass) {
		this.paramClass = paramClass;
	}
	public windowVO getResultClass() {
		return resultClass;
	}
	public void setResultClass(windowVO resultClass) {
		this.resultClass = resultClass;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getV_num() {
		return v_num;
	}
	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	public String getV_location() {
		return v_location;
	}
	public void setV_location(String v_location) {
		this.v_location = v_location;
	}
	public int getV_option() {
		return v_option;
	}
	public void setV_option(int v_option) {
		this.v_option = v_option;
	}
	public String getV_content() {
		return v_content;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public String getV_image() {
		return v_image;
	}
	public void setV_image(String v_image) {
		this.v_image = v_image;
	}
	public Calendar getToday() {
		return today;
	}
	public void setToday(Calendar today) {
		this.today = today;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getFileUploadPath() {
		return fileUploadPath;
	}
	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}
	public String getV_imagesv() {
		return v_imagesv;
	}
	public void setV_imagesv(String v_imagesv) {
		this.v_imagesv = v_imagesv;
	}
	public static Reader getReader() {
		return reader;
	}
	public static void setReader(Reader reader) {
		winWriteAction.reader = reader;
	}
	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}
	public static void setSqlMapper(SqlMapClient sqlMapper) {
		winWriteAction.sqlMapper = sqlMapper;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public List<ReservVO> getReservVO() {
		return reservVO;
	}
	public void setReservVO(List<ReservVO> reservVO) {
		this.reservVO = reservVO;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}

	public String getQ_dateStr() {
		return q_dateStr;
	}

	public void setQ_dateStr(String q_dateStr) {
		this.q_dateStr = q_dateStr;
	}

	
}