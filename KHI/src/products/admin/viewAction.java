package products.admin;

import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.InputStream;
import java.io.IOException;
import java.io.FileInputStream;

import java.net.URLEncoder;

public class viewAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ProductsVO paramClass = new ProductsVO();
	private ProductsVO resultClass = new ProductsVO();
	
	private int currentPage;
	private int p_no;

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	public viewAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception{

		paramClass.setP_no(getP_no());
		resultClass=(ProductsVO)sqlMapper.queryForObject("products.p_selectOne", paramClass);
		// 업데이트가 아니라 단순select이기때문에 "selectOne"과 paramClass를 받는다.
		
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


	public InputStream getInputStream() {
		return inputStream;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public String getContentDisposition() {
		return contentDisposition;
	}


	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}


	public long getContentLength() {
		return contentLength;
	}


	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	
	
}
