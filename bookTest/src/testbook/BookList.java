package testbook;
import java.sql.Connection;	
public class BookList {
	Connection con;
	public BookList(){
		//jdbc driver load 문장
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로드 성공");

	} catch (ClassNotFoundException e) {
		// TODO: handle exception
	e.printStackTrace();
	}
	
	}
	
	public static void main(String[] args) {
		BookList blist = new BookList();
	}

}
