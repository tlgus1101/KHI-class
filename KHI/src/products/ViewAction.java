package products;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

import products.ProductsVO;

public class ViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private ProductsVO paramClass=new ProductsVO();
	private ProductsVO resultClass=new ProductsVO();
	
	private int currentPage;
	private int p_no;

	
	public ViewAction() throws IOException{
		reader =Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper=SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	
	public String execute() throws Exception{
		paramClass.setP_no(getP_no());
		System.out.println(getP_no());
		System.out.println(paramClass);
		resultClass=(ProductsVO)sqlMapper.queryForObject("products.p_selectOne", paramClass);
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
	
	
}
