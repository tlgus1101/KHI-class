package notice;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Calendar;

import org.apache.commons.io.FileUtils;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;



public class noticeWriteAction extends ActionSupport {
	
	public static Reader reader; //파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper; //SqlMapClient API를 사용하기 위한 sqlMapper 객체
	
	private noticeVO paramClass; //파라미터를 저장할 객체 (객체를 전달하기 위해)
	private noticeVO resultClass; //쿼리 결과 값을 저장할 객체 (처리된 결과를 받기 위해)
	
	private int currentPage; //현재 페이지

	private int n_no; //글 번호
	private String n_subject; //제목
	private String n_content; //글 내용
	private String n_file_orgName; //업로드 파일의 원래 이름
	private String n_file_savName; 
	Calendar today = Calendar.getInstance(); //오늘 날짜 구하기.

	private File upload; //파일 객체
	private String uploadContentType; //컨텐츠 타입
	private String uploadFileName; //파일 이름
	private String fileUploadPath =  "C:\\java\\App\\KHI\\WebContent\\images\\"; //업로드 경로.
	
	//생성자
		public noticeWriteAction() throws IOException {
			reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // sqlMapConfig.xml 파일의 설정내용을 가져온다.
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sqlMapConfig.xml의 내용을 적용한 sqlMapper 객체 생성.

			reader.close();
		}
		
		//등록폼
		public String form() throws Exception {
			return SUCCESS;

		}
		
		//게시판 WRITE 액션
		public String execute() throws Exception {
			
			//파라미터와 리절트 객체 생성
			paramClass = new noticeVO();
			resultClass = new noticeVO();
			
			//등록할 항목 설정
			paramClass.setN_subject(getN_subject());
			paramClass.setN_content(getN_content());
			paramClass.setN_regdate(today.getTime());
			
			//등록 쿼리 수행
			sqlMapper.insert("notice.insertNotice", paramClass);
			
			//첨부파일을 선택했다면 파일을 업로드한다.
			if (getUpload() != null) {
				resultClass = (noticeVO) 
						sqlMapper.queryForObject("notice.selectLastNo");
				String file_name = "file_" + resultClass.getN_no();//file_글번호
				String file_ext = getUploadFileName().substring( //파일이름
						getUploadFileName().lastIndexOf('.') + 1,//확장자 가져온다.
						getUploadFileName().length());
				
				File destFile = new File(fileUploadPath + file_name + "." //업로드 경로+파일이름+.+확장자
						+ file_ext);
				FileUtils.copyFile(getUpload(), destFile);//파일객체에 destFile넣어서 copy
				
				paramClass.setN_no(resultClass.getN_no());
				paramClass.setN_file_orgname(getUploadFileName());	//원래 파일 이름
				paramClass.setN_file_savname(file_name + "." + file_ext); //서버에 저장한 파일 이름

	//paramClass : 자바빈
				//파일 정보 업데이트.(update를 호출해서 작업한다)
				sqlMapper.update("notice.updateFile", paramClass);


			}
			return SUCCESS;
			
		}

		public static Reader getReader() {
			return reader;
		}

		public static void setReader(Reader reader) {
			noticeWriteAction.reader = reader;
		}

		public static SqlMapClient getSqlMapper() {
			return sqlMapper;
		}

		public static void setSqlMapper(SqlMapClient sqlMapper) {
			noticeWriteAction.sqlMapper = sqlMapper;
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

		public String getN_file_orgName() {
			return n_file_orgName;
		}

		public void setN_file_orgName(String n_file_orgName) {
			this.n_file_orgName = n_file_orgName;
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

		public String getN_file_savName() {
			return n_file_savName;
		}

		public void setN_file_savName(String n_file_savName) {
			this.n_file_savName = n_file_savName;
		}
		
		
	
}
