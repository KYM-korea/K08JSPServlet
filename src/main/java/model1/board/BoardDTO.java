package model1.board;

public class BoardDTO {
	// 멤버 변수 선언 : board테이블에 생성된 컬럼과 동일
	private String num;
	private String Content;
	private String title;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	// member테이블과의 join을 통해 회원 이름을 출력해야할 경우를 위해
	// 멤버 변수 추가
	private String name;
	
	// 특별한 이유가 없다면 생성자는 정의하지 않아도됨 
	// getter/setter
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String Content) {
		this.Content = Content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}