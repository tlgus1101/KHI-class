package notice;

import java.io.File;
import java.io.IOException;
import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;

public class noticeDeleteAction extends ActionSupport {
	
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private noticeVO paramClass; //�Ķ���͸� ������ ��ü
	private noticeVO resultClass; 

	private int currentPage;	//���� ������
	
	private String fileUploadPath = "C:\\Java\\KhiClassProject\\";
	
	private int n_no;
	
	// ������
		public noticeDeleteAction() throws IOException {
			
			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml ������ ���������� �����´�.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml�� ������ ������ sqlMapper ��ü ����.
			reader.close();
		}
		
		// �Խñ� �� ����
		public String execute() throws Exception {
			
			//�Ķ���Ϳ� ����Ʈ ��ü ����.
			paramClass = new noticeVO();
			resultClass = new noticeVO();
			
			// �ش� ��ȣ�� ���� �����´�.
			resultClass = (noticeVO) sqlMapper.queryForObject("notice.selectOne", getN_no());

			//���� ���� ����
			File deleteFile = new File(fileUploadPath + resultClass.getN_file_savname());
			deleteFile.delete();

			// ������ �׸� ����.
			paramClass.setN_no(getN_no());
					
			// ���� ���� ����.(DB ����)
			sqlMapper.update("notice.deleteNotice", paramClass);

			return SUCCESS;
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			noticeDeleteAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			noticeDeleteAction.sqlMapper = sqlMapper;
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

		public String getFileUploadPath() {
			return fileUploadPath;
		}

		public void setFileUploadPath(String fileUploadPath) {
			this.fileUploadPath = fileUploadPath;
		}

		public int getN_no() {
			return n_no;
		}

		public void setN_no(int n_no) {
			this.n_no = n_no;
		}
		

}
