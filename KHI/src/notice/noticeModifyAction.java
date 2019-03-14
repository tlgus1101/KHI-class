package notice;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class noticeModifyAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private noticeVO paramClass; // 1Ķ111͸1 111111 11ü
	private noticeVO resultClass; // 1111 111 1111 111111 11ü

	private int currentPage; // 1111 111111

	private int n_no;
	private String n_subject;
	private String n_content;
	private String old_file;

	private File upload; // 1111 11ü
	private String uploadContentType; // 111111 Ÿ11
	private String uploadFileName; // 1111 1̸1
	private String fileUploadPath = "C:\\java\\App\\KHI\\WebContent\\images\\"; // 111ε1 111.
	// 111۵1 1111 1ޱ1 1111 1111 1111

	public noticeModifyAction() throws IOException {

		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 111111 1111111111 11111´1.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml11 111111 111111 sqlMapper 11ü 1111.
		reader.close();
	}

	// 1Խñ1 1111
	public String execute() throws Exception {

		// 1Ķ111Ϳ1 1111Ʈ 11ü 1111.
		paramClass = new noticeVO();
		resultClass = new noticeVO();

		paramClass.setN_no(getN_no());
		paramClass.setN_subject(getN_subject());
		paramClass.setN_content(getN_content());

		sqlMapper.update("notice.updateNotice", paramClass);

		if (getUpload() != null) {
			String file_name = "file_" + getN_no();
			String file_ext = getUploadFileName().substring(getUploadFileName().lastIndexOf('.') + 1,
					getUploadFileName().length());

			// 1111 1111 1111
			// 1̹1 111ε1Ǿ11ִ1 111111 11111Ѵ1.
			File deleteFile = new File(fileUploadPath + getOld_file());
			deleteFile.delete();

			// 11 1111 111ε1
			File destFile = new File(fileUploadPath + file_name + "." + file_ext);
			FileUtils.copyFile(getUpload(), destFile);

			// 1111 1111 1Ķ1111 1111.
			paramClass.setN_file_orgname(getUploadFileName());
			paramClass.setN_file_savname(file_name + "." + file_ext);

			// 1111 1111 111111Ʈ.
			sqlMapper.update("notice.updateFile", paramClass);
		}
		// 111111 111111 view 11111111 1̵1.
		resultClass = (noticeVO) sqlMapper.queryForObject("notice.selectOne", getN_no());

		return SUCCESS;

	}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		noticeModifyAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		noticeModifyAction.sqlMapper = sqlMapper;
	}

	public noticeVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(noticeVO paramClass) {
		this.paramClass = paramClass;
	}

	public noticeVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(noticeVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getN_subject() {
		return n_subject;
	}

	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
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
