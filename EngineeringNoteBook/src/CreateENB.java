import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateENB
 */
@WebServlet("/CreateENB")
public class CreateENB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateENB() {
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
        
 		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	    System.out.println("utilDate:" + utilDate);
	    System.out.println("sqlDate:" + sqlDate);

	    
         String project=request.getParameter("project");
         String title=request.getParameter("title");

         HttpSession s=request.getSession(true);
         
         String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
         String DB_URL = "jdbc:mysql://localhost:3306/enb_tool";   
         String USER = "root";
         String PASS = "";
         try
         {
         	Class.forName(JDBC_DRIVER).newInstance();
         	conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            int result = stmt.executeUpdate("insert into enb_details values ('"+s.getAttribute("id")+"','"+project+"','"+title+"','"+sqlDate+"')");
            if(result == 1)
            {
            	response.sendRedirect("ENB.jsp");
            }
            else
            {
            	
            }
            
            
         }
         catch(SQLException e)
         {
         	response.sendRedirect("createENBError.jsp");
         }

         catch(Exception e)
         {
         	System.out.println(e);
         }

	}

}
