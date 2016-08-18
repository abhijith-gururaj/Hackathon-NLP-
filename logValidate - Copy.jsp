<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"     %>
  <%@page import = " java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<%@page import = " java.sql.PreparedStatement"%>
<%@page import = " java.sql.ResultSet"%>
<%@page import = " java.sql.SQLException"%>

    
    
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int uid=Integer.parseInt(request.getParameter("uid"));
String password=request.getParameter("pwd");
int did;
String dpass;

Class.forName("oracle.jdbc.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
PreparedStatement pst;
ResultSet rs;
Connection conn=DriverManager.getConnection(url,"system","12345");
pst=conn.prepareStatement("select ID,PASSWORD from USER_DETAILS");

rs=pst.executeQuery();


while(rs.next())
{
did=rs.getInt(1);
dpass=rs.getString(2);

      if(uid==did && password.equals(dpass))
      {
    	  out.println("Successful Login");
      }
      else 
    	  out.println("Not Valid User");

}

%>

</body>
</html>