import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SQL_Injection extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

		Connection con = null;
		String stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/students";
			con = DriverManager.getConnection(url, "root", "root");
			stmt = con.nativeSQL("SELECT * from groups WHERE group_id=" + request.getParameter("id"));
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}
}