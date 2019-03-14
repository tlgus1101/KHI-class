package products;

import com.opensymphony.xwork2.ActionSupport;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import products.ProductsVO;
import products.WinPagingAction;

public class ListAction extends ActionSupport{

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<ProductsVO> list = new ArrayList<ProductsVO>();
	// bean
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount=9;
	private int blockPage = 5;
	private String pagingHtml;
	private WinPagingAction page;
	// paging에 필요한 것들
	
	// 생성자 오버로딩하기
	public ListAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); // 컨피그 파일 가져오기
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); // sql에 대입 이래야 SQL문 사용 가능
		reader.close(); // 필요 없는 건 닫는다.
	}
	
	public String execute() throws Exception{
		// 전체리스트 불러오는 메소드. 이건 나중에 admin에서 모든 리스트를 불러올 때 사용한다.
		list = sqlMapper.queryForList("products.p_selectOut");
		// 발코니 리스트를 불러온다.
		
		totalCount = list.size(); // list객체의 크기- totalCount
		page = new WinPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount) // 마지막 페이지가 전체 수보다 작으면
			lastCount = page.getEndCount()+1; // +1 하기.
		// 여기까지가 페이징하기	
//		System.out.println("토탈: "+totalCount);
		list = list.subList(page.getStartCount(), lastCount);
		// list객체에 첫줄부터 끝줄까지 담아온다.
//		System.out.println("리스트: "+list);
		return SUCCESS;
	}
	
	
	public String listIn() throws Exception{
		// 위와 동일한 로직으로 내창 리스트만 불러온다.
		list = sqlMapper.queryForList("products.p_selectIn");
		
		totalCount = list.size();
		page = new WinPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount)
			lastCount = page.getEndCount()+1;
		
//		System.out.println("내창 토탈: "+totalCount);
		list = list.subList(page.getStartCount(), lastCount);
		// list객체에 첫줄부터 끝줄까지 담아온다.
//		System.out.println("내창 리스트: "+list);
		
		return SUCCESS;
	}
	
	public String listAcc() throws Exception{
		// 위와 동일한 로직으로 악세서리 리스트만 불러온다.
		list = sqlMapper.queryForList("products.p_selectAcc");
		
		totalCount = list.size();
		page = new WinPagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		if(page.getEndCount()<totalCount)
			lastCount = page.getEndCount()+1;
		
//		System.out.println("악세 토탈: "+totalCount);
		list = list.subList(page.getStartCount(), lastCount);
		// list객체에 첫줄부터 끝줄까지 담아온다.
//		System.out.println("악세 리스트: "+list);	
		
		return SUCCESS;
	}
	
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		ListAction.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		ListAction.sqlMapper = sqlMapper;
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

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
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

	public List<ProductsVO> getList() {
		return list;
	}

	public void setList(List<ProductsVO> list) {
		this.list = list;
	}

	public WinPagingAction getPage() {
		return page;
	}

	public void setPage(WinPagingAction page) {
		this.page = page;
	}
}
