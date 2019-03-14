package qna;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.io.IOException;

import java.io.File;
import org.apache.commons.io.FileUtils;

public class QnAwriteAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private qnaVO paramClass;
	private qnaVO resultClass;

	private int currentPage=1;

	private int q_num;
	private int q_option;
	private String q_subject;
	private String q_name;
	private String q_phone1;
	private String q_phone2;
	private String q_email;
	private String q_password;
	private String q_content;
	private String file_orgName;
	private String file_savName;
	private String q_date;
	Calendar today = Calendar.getInstance();

	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String fileUploadPath = "C:\\uploadTest\\Java\\upload\\";

	private int ref;
	private int re_step;
	private int re_level;
	boolean reply = false;
	
	private int checkre;

	public QnAwriteAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();
	}

	public String QnAform() throws Exception {
		return SUCCESS;
	}

	public String reply() throws Exception {
		reply = true;
		resultClass = new qnaVO();

		resultClass = (qnaVO) sqlMapper.queryForObject("yh.selectOne", getQ_num());
		resultClass.setQ_subject("[답변]"+resultClass.getQ_name()+"님 답변입니다.");
		resultClass.setQ_name("관리자");
		resultClass.setQ_phone1("2222");
		resultClass.setQ_phone2("2345");
		resultClass.setQ_email("khi@naver.com");
		resultClass.setQ_password(resultClass.getQ_password());
		resultClass.setQ_content(resultClass.getQ_content() + "");
		resultClass.setFile_orgname(null);
		resultClass.setFile_savname(null);

		return SUCCESS;
	}

	public String execute() throws Exception {
		paramClass = new qnaVO();
		resultClass = new qnaVO();

		if (ref == 0) {
			paramClass.setRe_step(0);
			paramClass.setCheckre(1);

		} else {

			paramClass.setRef(getRef());
			paramClass.setRe_step(getRe_step());
			sqlMapper.update("yh.updateReplyStep", paramClass);
			paramClass.setCheckre(getCheckre());
			sqlMapper.update("yh.updateStep", paramClass);

			paramClass.setRe_step(getRe_step() + 1);
			paramClass.setRef(getRef());
			
			paramClass.setCheckre(getCheckre() + 1);
		}
		
		paramClass.setQ_subject(getQ_subject());
		paramClass.setQ_name(getQ_name());
		paramClass.setQ_phone1("123");
		paramClass.setQ_phone2("456");
		paramClass.setQ_email(getQ_email());
		paramClass.setQ_password(getQ_password());
		paramClass.setQ_content(getQ_content());
		paramClass.setRegdate(today.getTime());

		if(ref == 0)
			sqlMapper.insert("yh.insertQnA", paramClass);
		else
			sqlMapper.insert("yh.insertQnAReply", paramClass);

		if (getUpload() != null) {
			resultClass = (qnaVO) sqlMapper.queryForObject("yh.selectLastNo");
			String file_name = "file_" + resultClass.getQ_num();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			paramClass.setQ_num(resultClass.getQ_num());
			paramClass.setFile_orgname(getUploadFileName());
			paramClass.setFile_savname(file_name + "." + file_ext);

			sqlMapper.update("yh.updateFile", paramClass);
		}
		return SUCCESS;
	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		QnAwriteAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		QnAwriteAction.sqlMapper = sqlMapper;
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

	public String getFile_orgName() {
		return file_orgName;
	}

	public void setFile_orgName(String file_orgName) {
		this.file_orgName = file_orgName;
	}

	public String getFile_savName() {
		return file_savName;
	}

	public void setFile_savName(String file_savName) {
		this.file_savName = file_savName;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public boolean isReply() {
		return reply;
	}

	public void setReply(boolean reply) {
		this.reply = reply;
	}

	public int getQ_option() {
		return q_option;
	}

	public void setQ_option(int q_option) {
		this.q_option = q_option;
	}

	public int getCheckre() {
		return checkre;
	}

	public void setCheckre(int checkre) {
		this.checkre = checkre;
	}

	public String getQ_date() {
		return q_date;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}


}