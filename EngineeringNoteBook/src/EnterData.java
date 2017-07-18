

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class EnterData
 */
@WebServlet("/EnterData")
public class EnterData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnterData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String notes = request.getParameter("notes");
		System.out.println("NOTES");
		String[] deli = request.getParameterValues("deli");
		String[] plan = request.getParameterValues("plan");
		String[] did = request.getParameterValues("did");
		String[] size = request.getParameterValues("size");
		String[] effort = request.getParameterValues("effort");

		String[] gap = request.getParameterValues("gap");
		String[] lesson = request.getParameterValues("lesson");

		String[] deliverable = request.getParameterValues("deliverable");
		String[] accomlish = request.getParameterValues("accomlish");

		int planCount = 0;
		int deliCount = 0;
		int lessCount = 0;
		
		if(deli != null && deliverable != null && gap != null)
		{
			planCount = deliverable.length;
			deliCount = deli.length;
			lessCount = gap.length;
		}
		
		java.util.Date utilDate = new java.util.Date();
	    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	    System.out.println("utilDate:" + utilDate);
	    System.out.println("sqlDate:" + sqlDate);

	  	HttpSession s=request.getSession(true);
	  	
	  	try
	  	{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root", "");
			Statement stmt = con.createStatement();
			
			
			
			stmt.executeUpdate("insert into notes values('"+s.getAttribute("id")+"','"+sqlDate+"','"+notes+"')");

			for(int i=0; i<deliCount; i++)
			{
				stmt.executeUpdate("insert into deliverables values('"+s.getAttribute("id")+"','"+sqlDate+"','"+deli[i]+"','"+plan[i]+"','"+did[i]+"','"+size[i]+"','"+effort[i]+"')");
				System.out.println(deli[i]+" "+plan[i]+" "+did[i]+" "+size[i]+" "+effort[i]);
			}
			
			for(int i=0; i<lessCount; i++)
			{
				stmt.executeUpdate("insert into lessons values('"+s.getAttribute("id")+"','"+sqlDate+"','"+gap[i]+"','"+lesson[i]+"')");
				System.out.println(gap[i]+" "+lesson[i]);
			}
			
			for(int i=0; i<planCount; i++)
			{
				stmt.executeUpdate("insert into plan values('"+s.getAttribute("id")+"','"+sqlDate+"','"+deliverable[i]+"','"+accomlish[i]+"')");
				System.out.println(deliverable[i]+" "+accomlish[i]);
			}

	  	}
	  	
	  	catch(Exception e)
	  	{
	  		System.out.println(e);
	  	}
		
	  	response.sendRedirect("home.jsp");

	}
}