

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/";
		String dbName = "enb_tool";
		String driver = "com.mysql.jdbc.Driver";
		
		String uname = request.getParameter("EmpID");
		String pwd   = request.getParameter("password");
		String name = "";
		String id = "";
		try
		{
			Class.forName(driver).newInstance();
			con = DriverManager.getConnection(url+dbName,"root","");
			System.out.println("Connected to the database");
			Statement smt=  con.createStatement();
			String query = "select * from user";
			java.sql.ResultSet Rs = smt.executeQuery(query);
			
			boolean flag=false;
			
			for(int i=0; Rs.next(); i++)
			{
				if(uname.matches(Rs.getString("userid")) && pwd.matches(Rs.getString("password")))
						{
							id = Rs.getString("userid");
							name = Rs.getString("name");
							flag=true;
							break;
						}
			}
			
			if(flag==false)
				response.sendRedirect("./index3.jsp#tologin");
			else
			{
				HttpSession s=request.getSession(true);
				s.setAttribute("id",new String(id));
				s.setAttribute("name",new String(name));
			    s.setAttribute("pass",new String(pwd));
			    s.setAttribute("owner","Vishnu");
				response.sendRedirect("home.jsp");
			}
			
			Rs.close();
			smt.close();
			con.close();
		}
		
		catch (Exception e)
		{
			System.out.println(e);
		}
		

	}

}
