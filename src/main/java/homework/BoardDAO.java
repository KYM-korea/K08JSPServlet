package homework;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class BoardDAO extends JDBConnet{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalcount = 0;
		
		String query = "SELECT COUNT(*) FROM board";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalcount=rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return totalcount;
	}
	
	public List<BoardDTO> selectList(Map<String,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		
		String query = "SELECT * FROM board";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
				+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		query += " ORDER BY num DESC";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();				
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				
				bbs.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		String query = "INSERT INTO board "
				+ "(num, title, content, id, visitcount) "
				+ "values (SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, 0)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name"
				+ " FROM board B join member M"
				+ " on B.id=M.id WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateVisitcount(String num) {
		String query = "UPDATE board SET "
				+ "visitcount = visitcount+1 WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		String query = "UPDATE board SET"
				+ " title = ? AND content = ? "
				+ " WHERE num = ?";
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			
			result = psmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteEdit(BoardDTO dto) {
		int result = 0;

		try {
			String query = "DELETE FROM board "
					+ " WHERE num = ?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}