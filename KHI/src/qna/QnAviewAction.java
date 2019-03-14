package qna;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.io.Reader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.IOException;

import java.net.URLEncoder;

public class QnAviewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private qnaVO paramClass = new qnaVO();
	private qnaVO resultClass = new qnaVO();
	
	private int currentPage;
	
	private int q_num;
	private String q_name;
	private String q_password;
	private String fileUploadPath = "C:\\uploadTest\\Java\\upload\\";
	private InputStream inputStream; 
	private String contentDisposition;
	private long contentLength;
	
	public QnAviewAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}
	
	public String execute() throws Exception {
		paramClass.setQ_num(getQ_num());
		resultClass = (qnaVO)sqlMapper.queryForObject("yh.selectOne", getQ_num());
		return SUCCESS;
	}
	
	public String download() throws Exception {
		resultClass = (qnaVO)sqlMapper.queryForObject("yh.selectOne", getQ_num());
		File fileInfo = new File(fileUploadPath+resultClass.getFile_savname());
		setContentLength(fileInfo.length());
		setContentDisposition("attachment;filename="+URLEncoder.encode(resultClass.getFile_orgname(), "UTF-8"));
		setInputStream(new FileInputStream(fileUploadPath+resultClass.getFile_savname()));
		return SUCCESS;
	}
	
	public String checkForm() throws Exception {
		return SUCCESS;
	}
	
	public String checkAction() throws Exception {
		paramClass.setQ_num(getQ_num());
		paramClass.setQ_password(getQ_password());
		resultClass = (qnaVO)sqlMapper.queryForObject("yh.selectPassword", paramClass);
		
		if(resultClass==null)
			return ERROR;
		
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		QnAviewAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		QnAviewAction.sqlMapper = sqlMapper;
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

	public String getQ_password() {
		return q_password;
	}

	public void setQ_password(String q_password) {
		this.q_password = q_password;
	}

	public String getFileUploadPath() {
		return fileUploadPath;
	}

	public void setFileUploadPath(String fileUploadPath) {
		this.fileUploadPath = fileUploadPath;
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

	public String getQ_name() {
		return q_name;
	}

	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}


}
