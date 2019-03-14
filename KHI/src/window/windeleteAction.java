package window;

import com.opensymphony.xwork2.ActionSupport;


import window.windowVO;


import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.File;
import java.io.Reader;
import java.io.IOException;

public class windeleteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private windowVO paramClass;
	private windowVO resultClass;
		
	private int currentPage;
	
	private String fileUploadPath = "C:\\Java\\App\\KHI\\WebContent\\images\\";
	
	private int v_num;
	
	public windeleteAction() throws IOException {
		
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new windowVO();
		resultClass = new windowVO();
		
		resultClass = (windowVO)sqlMapper.queryForObject("windowOne", getV_num());
		//파일 삭제
		File deleteFile = new File(fileUploadPath + resultClass.getV_imagesv());
		deleteFile.delete();
		//삭제할 항목 설정
		paramClass.setV_num(getV_num());
		//삭제 해버려
		sqlMapper.update("deleteWindow", paramClass);
		
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

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
	}

	public int getV_num() {
		return v_num;
	}

	public void setV_num(int v_num) {
		this.v_num = v_num;
	}
	
	

}
