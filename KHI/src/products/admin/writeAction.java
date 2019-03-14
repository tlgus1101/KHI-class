package products.admin;

import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.util.Calendar;
import java.util.Date;
import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;

public class writeAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ProductsVO paramClass;
	private ProductsVO resultClass;
	
	private int currentPage;
	
	private int p_no;
	private String p_name;
	private int p_type;
	private int p_price;
	
	private String p_org;
	private String p_mf;
	private int p_frame;
	private int p_sash;
	private String p_detail;
	
	private int p_quan;
	private int p_option;
	private String p_image;
	private String p_imagesv;

	Calendar today = Calendar.getInstance();
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Java\\App\\KHI\\WebContent\\imageFIle\\";
	
	long filename_date = System.currentTimeMillis();
	
	// ������ �����ε�
	public writeAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String form() throws Exception{
		return SUCCESS;
	}
	
	public String execute() throws Exception{
		paramClass = new ProductsVO();
		resultClass = new ProductsVO();
		
		/* 	����
		 *	p_no 	p_name	p_type	p_regDate
		 *	p_price	p_org	p_mf	p_frame
		 *	p_sash	p_detail	p_quan	p_option
		 *	p_image p_imagesv
		 */
//		paramClass.setP_no(getP_no());
		paramClass.setP_name(getP_name());
		paramClass.setP_type(getP_type());
		paramClass.setP_regDate(today.getTime());
		paramClass.setP_price(getP_price());
		paramClass.setP_org(getP_org());
		paramClass.setP_mf(getP_mf());
		
		paramClass.setP_frame(getP_frame());
		paramClass.setP_sash(getP_sash());
		paramClass.setP_detail(getP_detail());
		paramClass.setP_quan(getP_quan());
		paramClass.setP_option(getP_option());
		
//		System.out.println("�̸�? "+getP_name());
//		System.out.println("����? "+getUpload());

		sqlMapper.insert("products.p_insertProducts", paramClass);
		
//		System.out.println("����? "+getUpload()); // ����
		
		if (getUpload() != null) {
			
	//	System.out.println("���� �Ѿ��? "+getUpload());

			resultClass = (ProductsVO) sqlMapper.queryForObject("products.p_selectLastNo");

			String file_name="fime_"+resultClass.getP_no();// ���� �̸� ����
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1, getUploadFileName().length()); // ���� Ȯ���� Ȯ��
			
//			System.out.println(file_name);
//			System.out.println(file_ext);
			// ��������� �� ����
			
			// ���ϰ��+�����̸�+.+Ȯ���� �� �������� �̹��� ������ �����Ѵ�.
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			System.out.println("������? "+destFile);
			FileUtils.copyFile(getUpload(), destFile);
//			System.out.println("�ȳ�����? "+destFile);
//			System.out.println("�ʵ� ������? "+getUpload());
//			System.out.println("�̰͵� ������? "+getUploadFileName());
			
			
			paramClass.setP_no(resultClass.getP_no());
			paramClass.setP_image(getUploadFileName());
			paramClass.setP_imagesv(file_name + "." + file_ext);


			
		//	System.out.println("�̹�������?"+getP_image());
			sqlMapper.update("products.p_updateImage", paramClass);
		//	System.out.println("�̹�������?"+getP_image());
			
		}
		return SUCCESS;
		
	}

	public ProductsVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(ProductsVO paramClass) {
		this.paramClass = paramClass;
	}

	public ProductsVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(ProductsVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_type() {
		return p_type;
	}

	public void setP_type(int p_type) {
		this.p_type = p_type;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_org() {
		return p_org;
	}

	public void setP_org(String p_org) {
		this.p_org = p_org;
	}

	public String getP_mf() {
		return p_mf;
	}

	public void setP_mf(String p_mf) {
		this.p_mf = p_mf;
	}

	public int getP_frame() {
		return p_frame;
	}

	public void setP_frame(int p_frame) {
		this.p_frame = p_frame;
	}

	public int getP_sash() {
		return p_sash;
	}

	public void setP_sash(int p_sash) {
		this.p_sash = p_sash;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public int getP_quan() {
		return p_quan;
	}

	public void setP_quan(int p_quan) {
		this.p_quan = p_quan;
	}

	public int getP_option() {
		return p_option;
	}

	public void setP_option(int p_option) {
		this.p_option = p_option;
	}

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
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

	public String getP_imagesv() {
		return p_imagesv;
	}

	public void setP_imagesv(String p_imagesv) {
		this.p_imagesv = p_imagesv;
	}
	
	

}
