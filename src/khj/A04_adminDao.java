package khj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import z01_vo.Member;

public class A04_adminDao {
	private Connection con;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

//	1) 연결 공통 메서드 선언	
	private void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:xe";
		con = DriverManager.getConnection(info, "scott", "tiger");
		System.out.println("정상 접속 성공!");
	}
	
	public Member getMember(String mem_name){
		Member mem=null;
		try {
			setConn(); // Connection 객체가 메모리 로딩.
			String sql = "SELECT * \r\n" + 
					"FROM p5_member\r\n" + 
					"WHERE mem_name= ? ";
					System.out.println("##sql##");
					System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_name );
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				mem = new Member(rs.getString("mem_id"),
								   rs.getString("mem_pw"),
								   rs.getString("mem_name"),
								   rs.getDate("mem_birth"),
								   rs.getString("mem_email"),
								   rs.getString("mem_tel"),
								   rs.getDate("mem_jdate"));
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return mem;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
	}

}