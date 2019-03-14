package window;

import com.opensymphony.xwork2.ActionSupport;


import window.windowVO;
import window.windowPaging;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient; 
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
 
import java.util.*;
import java.io.Reader;
import java.io.IOException;


public class winListAction extends ActionSupport {
	public static Reader reader;	//파일 스트림을 위한 reader.
	public static SqlMapClient sqlMapper;	//SqlMapClient API를 사용하기 위한 sqlMapper 객체.

	private List<windowVO> list = new ArrayList<windowVO>();;
	private String searchKeyword;
	private int searchNum;
	
	private int currentPage = 1;	//현재 페이지
	private int totalCount; 		// 총 게시물의 수
	private int blockCount = 10;	// 한 페이지의  게시물의 수
	private int blockPage = 5; 	// 한 화면에 보여줄 페이지 수
	private String pagingHtml; 	//페이징을 구현한 HTML
	private windowPaging page; 	// 페이징 클래스
	private int num=0;

	public winListAction() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml"); //sqlMapConfig.xml파일의 설정내용을 가져온다.
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader); //sqlMapconfig.xml의 내용을 적용한 sqlMapper 객체 생성.
		reader.close();
	}
public String execute() throws Exception {
		
		if(getSearchKeyword() != null) {
			return search();
		}
		list = sqlMapper.queryForList("windowALL"); //모든글을 가져와 리스트에 넣음
		totalCount = list.size(); //전체 글 갯수를 구함
		page = new windowPaging(currentPage, totalCount, blockCount, blockPage, num, ""); //페이징액션 객체생성
		pagingHtml = page.getPagingHtml().toString(); //페이지HTML생성.
		//현재 페이지에서 보여줄 마지막 글의 번호설정.
		int lastCount = totalCount;
		//현재 페이지의 마지막 글의 번호가 전체의 마지막 글 번호보다 작으면 lastCount +1번호로 설정
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		//전체 리스트에서 현재 페이지만큼의 리스트만 가져온다.
		list = list.subList(page.getStartCount(), lastCount);

		
		return SUCCESS;
	}
public String search() throws Exception {
	if(searchNum == 0) { //장소로 검색
		list = sqlMapper.queryForList("windowSearchA", "%"+getSearchKeyword()+"%");
	}
	if(searchNum == 1) { //제목
		list = sqlMapper.queryForList("windowSearchB", "%"+getSearchKeyword()+"%");
}
	
	totalCount = list.size(); //담아논 정보들 넣어주고 페이징 준비 완료
	page = new windowPaging(currentPage, totalCount, blockCount, blockPage, searchNum, getSearchKeyword());
	pagingHtml = page.getPagingHtml().toString();
	
	int lastCount = totalCount;
	if(page.getEndCount() < totalCount)
		lastCount = page.getEndCount() + 1;
	list = list.subList(page.getStartCount(), lastCount); 
	return SUCCESS;
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

public List<windowVO> getList() {
	return list;
}
public void setList(List<windowVO> list) {
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

public windowPaging getPage() {
	return page;
}
public void setPage(windowPaging page) {
	this.page = page;
}



}

