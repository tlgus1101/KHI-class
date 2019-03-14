package cus;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

import qna.qnaVO;

public class CUSmodifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO paramClass;
	private qnaVO resultClass;
	
	private int currentPage;
	
	private int q_num;
	private String q_subject;
	private String q_name;
	private String q_phone1;
	private String q_phone2;
	private String q_email;
	private String q_password;
	private String q_date;
	private String q_content;
	private String old_file;
	
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\uploadTest\\Java\\upload\\";
	
	public CUSmodifyAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();
		
		paramClass.setQ_num(getQ_num());
		paramClass.setQ_subject(getQ_subject());
		paramClass.setQ_name(getQ_name());
		paramClass.setQ_phone1(getQ_phone1());
		paramClass.setQ_phone2(getQ_phone2());
		paramClass.setQ_email(getQ_email());
		paramClass.setQ_password(getQ_password());
		paramClass.setQ_date(getQ_date());
		paramClass.setQ_content(getQ_content());
		
		sqlMapper.update("yh.updateCUS", paramClass);
		
		if(getUpload()!=null) {
			String file_name = "file_" + resultClass.getQ_num();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.')+1, getUploadFileName().length());
			
			File deleteFile = new File(fileUploadPath+getOld_file());
			deleteFile.delete();
			
			File destFile = new File(fileUploadPath+file_name+"."+file_ext);
			FileUtils.copyFile(getUpload(), destFile);
			
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name+"."+file_ext);
			
			sqlMapper.update("yh.updateFile", paramClass);
		}
		resultClass = (qnaVO)sqlMapper.queryForObject("yh.selectOne", getQ_num());
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		CUSmodifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		CUSmodifyAction.sqlMapper = sqlMapper;
	}

	public qnaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(qnaVO paramClass) {
		this.paramClass = paramClass;
	}

	public qnaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(qnaVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_subject() {
		return q_subject;
	}

	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}

	public String getQ_password() {
		return q_password;
	}

	public void setQ_password(String q_password) {
		this.q_password = q_password;
	}

	public String getQ_phone1() {
		return q_phone1;
	}

	public void setQ_phone1(String q_phone1) {
		this.q_phone1 = q_phone1;
	}

	public String getQ_phone2() {
		return q_phone2;
	}

	public void setQ_phone2(String q_phone2) {
		this.q_phone2 = q_phone2;
	}

	public String getQ_email() {
		return q_email;
	}

	public void setQ_email(String q_email) {
		this.q_email = q_email;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
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

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	
}
