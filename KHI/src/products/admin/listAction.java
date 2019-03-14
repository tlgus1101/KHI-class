package products.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;

import products.ProductsVO;
import products.admin.pagingAction;

public class listAction extends ActionSupport {

	public static Reader reader;
	public static SqlMapClient sqlMapper;
	
	private List<ProductsVO> list = new ArrayList<ProductsVO>();
	private String searchKeyword;
	private int searchNum;
	
	private int currentPage = 1;	//1111 111111
	private int totalCount; 		// 11 1Խù111 11
	private int blockCount = 10;	// 11 11111111  1Խù111 11
	private int blockPage = 5; 	// 11 ȭ1鿡 111111 111111 11
	private String pagingHtml; 	//1111¡11 111111 HTML
	private pagingAction page; 	// 1111¡ Ŭ1111
	
	private int sortByQuan;
	private int sortByOption;
	
	public static final int QUANDESC = 1;
	public static final int QUANASE = 2;
	public static final int OPTIONDESE = 1;
	public static final int OPTIONASE = 2;
	
	
	// 111111 11111ε1
	public listAction() throws IOException{
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		// sqlMapConfig.xml 111111 1111111111 11111´1.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		// sqlMapConfig.xml11 111111 111111 sqlMapper 11ü 1111.
		reader.close();
	}
	
	
	

	public String execute() throws Exception{

		if(getSearchKeyword() != null) {
			return searchPd();
		}
		
		
		if(sortByQuan == QUANDESC) {
			list = sqlMapper.queryForList("products.p_selectAllQuanDesc");
			
			totalCount = list.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
		}else if(sortByQuan == QUANASE) {
			list = sqlMapper.queryForList("products.p_selectAllQuanAsc");
			
			totalCount = list.size();// 11ü 1111 1111
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
		}else if(sortByOption == OPTIONDESE) {
			list = sqlMapper.queryForList("products.p_selectAllOptionDesc");
			
			totalCount = list.size();// 11ü 1111 1111
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
		}else if(sortByOption == OPTIONASE) {
			list = sqlMapper.queryForList("products.p_selectAllOptionAsc");
			
			totalCount = list.size();// 11ü 1111 1111
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
		}else{
			// 1Ǹ1 1111 111 1111Ʈ11 11111´1.
			list = sqlMapper.queryForList("products.p_selectAll");
			
			// 11ü 1111 111111 111Ѵ1.
			totalCount = list.size();// 11ü 1111 1111
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			// 111111 html11111ϱ1
			
			int lastCount = totalCount;
			// 1111 1111111111 111111 111111 1111 11ȣ 11111ϱ1
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
		}
		
		return SUCCESS;
	}
	
	// 1111 1Խ111 1Ǹ111111ǰ list 1׼1
		public String finishSale() throws Exception{
			
			// 1˻11111 1߰1
			if(getSearchKeyword() != null) {
				return searchPd();
			}
			
			// 1Ǹ1 11111 111 1111Ʈ11 11111´1.
			list = sqlMapper.queryForList("products.p_finishSale");
			
			// 11ü 1111 111111 111Ѵ1.
			totalCount = list.size();// 11ü 1111 1111
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
			pagingHtml = page.getPagingHtml().toString();
			// 111111 html11111ϱ1
			
			int lastCount = totalCount;
			// 1111 1111111111 111111 111111 1111 11ȣ 11111ϱ1
			
			if(page.getEndCount()<totalCount)
				lastCount = page.getEndCount()	+1;
			
			list = list.subList(page.getStartCount(), lastCount);
			
			return SUCCESS;
		}
	
	
	// 1˻1 1޼ҵ1
	public String searchPd() throws Exception {
		
		String searchType = null;
		
		if(searchNum == 0) { 
			list = sqlMapper.queryForList("products.p_selectSearchName", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 1) { 
			list = sqlMapper.queryForList("products.p_selectSearchNo", "%"+getSearchKeyword()+"%");
		}
		if(searchNum == 2) {
			
			if(getSearchKeyword().equals("발코니")){
				searchType= "1";
			}
			if(getSearchKeyword().equals("내창")){
				searchType= "2";
			}
			if(getSearchKeyword().equals("악세사리")){
				searchType= "3";
			}
			
			list = sqlMapper.queryForList("products.p_selectSearchType", searchType);

		}
		
		totalCount = list.size();// 11ü 1111 1111
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
	
		int lastCount = totalCount;
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		list = list.subList(page.getStartCount(), lastCount); 
		return SUCCESS;
	}


	public List<ProductsVO> getList() {
		return list;
	}



	public void setList(List<ProductsVO> list) {
		this.list = list;
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



	public pagingAction getPage() {
		return page;
	}



	public void setPage(pagingAction page) {
		this.page = page;
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



	public int getSortByQuan() {
		return sortByQuan;
	}



	public void setSortByQuan(int sortByQuan) {
		this.sortByQuan = sortByQuan;
	}



	public int getSortByOption() {
		return sortByOption;
	}



	public void setSortByOption(int sortByOption) {
		this.sortByOption = sortByOption;
	}

	
	
}
