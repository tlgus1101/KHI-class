package notice;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;



public class noticeAViewAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private noticeVO paramClass = new noticeVO(); //�Ķ���͸� ������ ��ü
//��ü �����ϱ� ����
	private noticeVO resultClass = new noticeVO(); //���� ��� ���� ������ ��ü //ó���� ����� �ޱ� ����

	private int currentPage;

	private int n_no;
	private String fileUploadPath = "C:\\java\\App\\KHI\\WebContent\\images\\";

	private InputStream inputStream;
	private String contentDisposition;
	private long contentLength;
	
	//��ü ��������
		// ������
		public noticeAViewAction() throws IOException {

			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
	//xml�� �о reader��ü ����
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}

		// �󼼺���
		public String execute() throws Exception {//ȭ�� �����ִ� execute�޼ҵ�

			

			// �ش� ��ȣ�� ���� �����´�.
			resultClass = (noticeVO) sqlMapper.queryForObject("notice.selectOne", getN_no());//selectOne�� ���� �۹�ȣ�� �ѱ�� ->parameterClass=int

			
			return SUCCESS;
		}
		//���� üũ��
		public String checkForm() throws Exception{
			return SUCCESS;
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			noticeAViewAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			noticeAViewAction.sqlMapper = sqlMapper;
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

		

}
