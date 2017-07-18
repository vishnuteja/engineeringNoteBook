<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 
	String project=request.getParameter("project");  
 	String buffer="<u>ENBs</u><br><br><ol>";
 	String id = session.getAttribute("id").toString();
 try
 {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();  
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root","");  
	 Statement stmt = con.createStatement();  
	 ResultSet rs = stmt.executeQuery("Select enb_title,date,userid from enb_details where projectname='"+project+"' and userid !='"+id+"'");  
	   
	 while(rs.next())
	  {
		 buffer=buffer+"<li><a href='viewOtherENB.jsp?id="+rs.getString(3)+"&date="+rs.getString(2)+"'>"+rs.getString(1)+" - "+rs.getString(2)+"</a></li>";  
	  }
	 
	 buffer=buffer+"</ol>";  
	 response.getWriter().println(buffer); 
 }
 
 catch(Exception e)
 {
     System.out.println(e);
 }

%>