

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotPswd
 */
@WebServlet("/forgotPswd")
public class forgotPswd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPswd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	            Connection conn = null;
	            Statement stmt = null;
	           
	            String id=request.getParameter("EmpID");
	            String em=request.getParameter("email");   
	         
	            String result=null;
	            String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	            String DB_URL = "jdbc:mysql://localhost:3306/enb_tool";   
	            String USER = "root";
	            String PASS = "";
	            try
	            {
	            	Class.forName(JDBC_DRIVER).newInstance();
	            	conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
	                stmt = conn.createStatement();   
	                ResultSet rs = stmt.executeQuery("select password from user where userid='"+id+"' and email='"+em+"'");
	                rs.next();
                    result=rs.getString("password");
                    if (result==null)
                    {
                    	response.sendRedirect("forgot_password.jsp");
                    }
                    else
                    {
                    	HttpSession s = request.getSession(true);
                    	s.setAttribute("Password", result);
                    	response.sendRedirect("viewPassword.jsp");
                    }
	            }
	            catch(Exception e)
	            {
	            	System.out.println(e);
	            }
	            
	 
	}

}
