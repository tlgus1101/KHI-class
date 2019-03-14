package window;

import com.opensymphony.xwork2.ActionSupport;

import window.windowVO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;


public class adminViewAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private windowVO paramClass = new windowVO();
	private windowVO resultClass = new windowVO();
	
	
	private int currentPage;
	private int v_num;
	
	
	
	public adminViewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass.setV_num(getV_num());
		//해당 글의 조회수 +1
		//sqlMapper.update("ReadWindow", paramClass);
		//해당 번호의 글을 가져온다.
		
		resultClass = (windowVO)sqlMapper.queryForObject("windowOne", getV_num());
		
		
		
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
	

}
