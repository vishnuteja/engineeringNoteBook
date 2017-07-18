<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String ID=request.getParameter("ID");  
 	String buffer="<h3>Select ENBs below</h3><select name='prjts' onchange='showENB(this.value)'><option value='-1'>Select</option>";	
 try
 {
	 Class.forName("com.mysql.jdbc.Driver").newInstance();  
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/enb_tool","root","");  
	 Statement stmt = con.createStatement();  
	 ResultSet rs = stmt.executeQuery("Select projectname from enb_details where userid='"+ID+"' ");  
	 
	 while(rs.next())
	 {
	   	buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>";  
	 }  
	 
	 buffer=buffer+"</select>";
	 response.getWriter().println(buffer); 
	 stmt.close();
	 rs.close();
	 con.close();
	 }
	 catch(Exception e){
	     System.out.println(e);
	 }
%>