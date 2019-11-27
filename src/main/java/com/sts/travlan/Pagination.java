public class Pagination {
	
	/** 한 페이지당 보여지는 게시글 수 **/
	private int pagePerPost = 8;
	
	/** << 1 2 3 4 5 >> -> 1부터 5까지 한 블럭(range) **/
	/** 한 블럭당 페이지 수 **/
	//private int rangePerPage = 5;
	
	/** 현재 페이지 **/
	private int nowPage = 1;
	
	/** 현재 블럭 **/
	//private int nowRange = 1;
	
	/** 총 게시글 수 **/
	private int total;
	
	/** 총 페이지 수 **/
	private int totalPage;
	
	/** 총 블럭 수 **/
	//private int totalRange;
	
	/** 1, 6, ... **/
	/** 시작 페이지 **/
	private int startPage = 1;
	
	/** 5, 10, ... **/
	/** 끝 페이지 **/
	private int endPage = 1;
	
	/** 이전 페이지 **/
	private boolean prev;
	
	/** 다음 페이지 **/
	private boolean next;

	public Pagination(int total, int nowPage) {
		
	}
	
	public int getPagePerPost() {
		return pagePerPost;
	}

	public void setPagePerPost(int pagePerPost) {
		this.pagePerPost = pagePerPost;
	}

//	public int getRangePerPage() {
//		return rangePerPage;
//	}
//
//	public void setRangePerPage(int rangePerPage) {
//		this.rangePerPage = rangePerPage;
//	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

//	public int getNowRange() {
//		return nowRange;
//	}
//
//	public void setNowRange(int nowRange) {
//		this.nowRange = nowRange;
//	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

//	public int getTotalRange() {
//		return totalRange;
//	}
//
//	public void setTotalRange(int totalRange) {
//		this.totalRange = totalRange;
//	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
}