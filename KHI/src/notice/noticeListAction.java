package notice;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.opensymphony.xwork2.ActionSupport;



public class noticeListAction extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<noticeVO> list= new ArrayList<noticeVO>();
	
	private String searchKeyword;
	private int searchNum;
	
	private int currentPage = 1; //1111111111
	private int totalCount; // 11 1Խù1 11
	private int blockCount = 10; //11 11111111 1Խù111 11
	private int blockPage =5; //11 ȭ1鿡 111111 111111 11
	private String pagingHtml; //1111¡11 111111 HTML
	private noticePagingAction page; //1111¡Ŭ1111
	private int num =0;
	
	public noticeListAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		reader.close();
	}
	
	//1Խ111 LIST 1׼1
		public String execute() throws Exception {
			if (getSearchKeyword() != null) { //1˻1 Ű111尡 111111
				return search(); //search()1޼ҵ1 1111
			}

			//111 1111 11111ͼ1 list11 1ִ´1.
			list = sqlMapper.queryForList("notice.selectAll");

			totalCount = list.size(); //11ü 11 111111 111Ѵ1.
			
			//pagingAction 11ü 1111
			page = new noticePagingAction(currentPage, totalCount, blockCount, blockPage, num, "");
			//pagingAction 111111
			pagingHtml = page.getPagingHtml().toString();
			//111111 HTML 1111, toString11 1ٿ11ָ1 String1111 1111
			
			//1111 1111111111 111111 111111 1111 11ȣ 1111 ->11 1Խù111 1111 111111 1۹1ȣ11 11111Ѵ1.
			int lastCount = totalCount;

			//1111 11111111 111111 1111 11ȣ11 11ü11 111111 11 11ȣ1111 111111
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			//11 1111111111 111111 1Խñ111 11 11ȣ11 +1 111ش1.

			//11ü 1111Ʈ1111 1111 11111111ŭ11 1111Ʈ11 11111´1.
			list = list.subList(page.getStartCount(), lastCount);
			return SUCCESS;
		}

		//1˻1 111 (0=1111,1=1111)
		public String search() throws Exception {

			// searchKeyword = new String(searchKeyword.getBytes("iso-8859-1"),"euc-kr") ;
			// System.out.println(searchKeyword);
			// System.out.println(searchNum);
			
			if (searchNum == 0) {
				list = sqlMapper.queryForList("notice.selectSearchS", "%" + getSearchKeyword() + "%");
			}
			if (searchNum == 1) {
				list = sqlMapper.queryForList("notice.selectSearchC", "%" + getSearchKeyword() + "%");
			}

			totalCount = list.size();
			
			//pagingAction 11ü 1111
			page = new noticePagingAction(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
			//pagingAction 111111
			pagingHtml = page.getPagingHtml().toString();

			//1111 1111111111 111111 111111 1111 11ȣ 1111 ->11 1Խù111 1111 111111 1۹1ȣ11 11111Ѵ1.
			int lastCount = totalCount;
			
			//1111 11111111 111111 1111 11ȣ11 11ü11 111111 11 11ȣ1111 111111
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			//11 1111111111 111111 1Խñ111 11 11ȣ11 +1 111ش1.

			//11ü 1111Ʈ1111 1111 11111111ŭ11 1111Ʈ11 11111´1.
			list = list.subList(page.getStartCount(), lastCount);
			return SUCCESS;
		}

	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		noticeListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		noticeListAction.sqlMapper = sqlMapper;
	}

	public List<noticeVO> getList() {
		return list;
	}

	public void setList(List<noticeVO> list) {
		this.list = list;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getSearchNum() {
		return searchNum;
	}

	public void setSearchNum(int searchNum) {
		this.searchNum = searchNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public String getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public noticePagingAction getPage() {
		return page;
	}

	public void setPage(noticePagingAction page) {
		this.page = page;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	

}
