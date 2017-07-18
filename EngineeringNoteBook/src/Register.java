

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");
        
        try 
        {          
			    
			    Class.forName("com.mysql.jdbc.Driver").newInstance();
			    Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root", "");
			    PreparedStatement ps=(PreparedStatement) con.prepareStatement("INSERT INTO user VALUES (?,?,?,?)");

			            String empid;
			            String name;        
			            String email;
			            String pswd;
			            
			          empid = request.getParameter("EmpIDsignup"); 
			          name = request.getParameter("fullname"); 
			          email = request.getParameter("emailsignup"); 
			          pswd = request.getParameter("passwordsignup"); 			           
			             
			    ps.setString(1, empid);            
			    ps.setString(2, name);
			    ps.setString(3, email);
			    ps.setString(4, pswd);
			   
			    if(!ps.execute())
			    {
			       response.sendRedirect("./index3.jsp#tologin");
			       // System.out.println("2");
			    }
			    else
			    {
			        response.sendRedirect("./index3.html");
			       // System.out.println("3");
			    }
			    ps.close();
			    con.close();
			
			} 
			catch (Exception e)
			{
			    
			       e.printStackTrace();
			      //System.out.println("4");
			}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
