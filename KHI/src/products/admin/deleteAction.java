package products.admin;

import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class deleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private ProductsVO paramClass; //�Ķ���͸� ������ ��ü
	private ProductsVO resultClass; //���� ��� ���� ������ ��ü

	private int currentPage;
	
	private String fileUploadPath = "C:\\Java\\App\\KHI\\WebContent\\imageFIle\\";
	
	private int p_no;
	
	
	// �����ڷ� �����޼ҵ� �ҷ�����
	public deleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml ������ ���������� �����´�.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		// sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
		reader.close();
	}

	// �Խñ� �� �����ϴ� execute()
	public String execute() throws Exception {
		
		paramClass = new ProductsVO();
		resultClass = new ProductsVO();
		// �ڹٺ� ��ü �����
		paramClass.setP_no(getP_no());
		// ���� ���� ���� paramClass�� ������ ��ǰ�� �ѹ��� �޾Ƽ� ���������� �Ʒ� resultClass���� ����� �� �ִ�.
		
		resultClass = (ProductsVO)sqlMapper.queryForObject("products.p_selectOne", paramClass);
											// selectOne���� ���� ������ �� paramClass�� ������ ��ǰ��ȣ �����ͼ�
											// resultClass�� ������� ��´� -> p_no�� �´� ���ڵ��� �ϳ� ��ȯ!!!

//		System.out.println("���: "+ fileUploadPath);
//		System.out.println(resultClass.toString());
//		System.out.println("����: "+resultClass.getP_image());
		File deleteFile = new File(fileUploadPath + resultClass.getP_image()); // �ش� ���ڵ��� �̹������� ����� ���� ����
		
		deleteFile.delete(); // �̹������� ���� �����

		
		sqlMapper.update("products.p_deleteProducts", paramClass); // ��ǰ��ȣ�� �´� ���ڵ� �����
		
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

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	
	

}
