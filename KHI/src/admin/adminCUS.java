package admin;

import com.opensymphony.xwork2.ActionSupport;

import qna.qnaVO;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import java.util.*;
import java.io.Reader;
import java.io.IOException;

import java.net.*;

public class adminCUS extends ActionSupport {
	public static Reader reader;
	public static SqlMapClient sqlMapper;

	private qnaVO paramClass = new qnaVO();
	private qnaVO resultClass = new qnaVO();

	private List<qnaVO> list = new ArrayList<qnaVO>();

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private adminpaging page;
	private int optionNum;
	private int q_num;
	private String q_name;
	private String q_password;
	private int checkre;

	public adminCUS() throws IOException {
		reader = Resources.getResourceAsReader("sqlMapConfig.xml");
		sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		reader.close();

	}

	public String execute() throws Exception {

		optionNum = 2;
		list = sqlMapper.queryForList("yh.selectCMOM");

		totalCount = list.size();
		page = new adminpaging(currentPage, totalCount, blockCount, blockPage, optionNum);
		pagingHtml = page.getPagingHtml().toString();

		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		return SUCCESS;
	}
	
	public static Reader getReader() {
		return reader;
	}

	public static void setReader(Reader reader) {
		adminCUS.reader = reader;
	}

	public static SqlMapClient getSqlMapper() {
		return sqlMapper;
	}

	public static void setSqlMapper(SqlMapClient sqlMapper) {
		adminCUS.sqlMapper = sqlMapper;
	}

	public List<qnaVO> getList() {
		return list;
	}

	public void setList(List<qnaVO> list) {
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



	public qnaVO getResultClass() {
		return resultClass;
	}

	public void setResultClass(qnaVO resultClass) {
		this.resultClass = resultClass;
	}

	public int getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

	public qnaVO getParamClass() {
		return paramClass;
	}

	public void setParamClass(qnaVO paramClass) {
		this.paramClass = paramClass;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
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

	public adminpaging getPage() {
		return page;
	}

	public void setPage(adminpaging page) {
		this.page = page;
	}

	public int getCheckre() {
		return checkre;
	}

	public void setCheckre(int checkre) {
		this.checkre = checkre;
	}

}
