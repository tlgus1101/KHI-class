package window;

import com.opensymphony.xwork2.ActionSupport;


import window.windowVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class adminModifyAction extends ActionSupport{
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private windowVO paramClass;
	private windowVO resultClass;
	
	private int currentPage;
	
	private int v_num;
	private String v_location;
	private String v_imagesv;
	private String v_content;
	private int v_option;
	private String old_file;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\Java\\App\\KHI\\WebContent\\images\\";
	
	public adminModifyAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	public String execute() throws Exception {
		
		paramClass = new windowVO();
		resultClass = new windowVO();
		//수정할 항목 설정.
		paramClass.setV_num(getV_num());
		paramClass.setV_imagesv(getV_imagesv());
		paramClass.setV_location(getV_location());
		paramClass.setV_content(getV_content());
		paramClass.setV_option(getV_option());
		//항목 수정
		sqlMapper.update("updateWindow", paramClass);
		
		//수정할 파일이 업로드 되었다면 파일을 업로드하고 Db의 file항목을 수정함.
		if(getUpload() != null) {
			
			//실제 서버에 저장될 파일 이름과 확장자 설정.
			String file_name = "file_" + getV_num();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			//기존 업로드된 파일 삭제
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();
			// 수정되어 올릴 업로드 파일 설정.
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			//파일정보 설정.
			paramClass.setV_image(getUploadFileName());
			paramClass.setV_imagesv(file_name + "." + file_ext);
			
			sqlMapper.update("updateImageFile", paramClass);
		}
		
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
	public String getV_location() {
		return v_location;
	}
	public void setV_location(String v_location) {
		this.v_location = v_location;
	}
	public String getV_imagesv() {
		return v_imagesv;
	}
	public void setV_imagesv(String v_imagesv) {
		this.v_imagesv = v_imagesv;
	}
	public String getV_content() {
		return v_content;
	}
	public void setV_content(String v_content) {
		this.v_content = v_content;
	}
	public int getV_option() {
		return v_option;
	}
	public void setV_option(int v_option) {
		this.v_option = v_option;
	}
	public String getOld_file() {
		return old_file;
	}
	public void setOld_file(String old_file) {
		this.old_file = old_file;
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
	
	


}



