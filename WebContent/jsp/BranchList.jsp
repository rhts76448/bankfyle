<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bankfyle.bean.bank" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Get Bank Details</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="content" style="max-width:2000px;margin-top:46px">
 <div class="bar cyan card-2 text-white">
  <div class="card-4 center container content round-xxlarge padding-large" style="max-width:800px"><b>
   <a href="index.jsp"><i class="fa fa-home left"></i></a>
  Branch List
  </b>
  </div>
  </div>
<div class="container center content  padding-64" style="max-width:800px">
<%
String bank=(String)session.getAttribute("bank");
String city=(String)session.getAttribute("city");
bank[] branch=(bank[])session.getAttribute("branch");
int p=0;
%>
<div class="container content">
<span class="text-white half content left cyan round-xxlarge padding-small"><b>Bank: <%=bank%></b></span>
<span class="text-white half content right cyan round-xxlarge padding-small"><b>City: <%=city%></b></span>
<br>

<%
if(branch!=null)
{
%>
<table class="table center text-cyan" align="center">
<%
	for(int i=0;i<branch.length;i++)
	{
		p=1;
%>
	<tr>
	<td><%=i+1 %></td>
	<td><a href="./BankDetails?ifsc=<%=branch[i].getIfsc() %>"><%=branch[i].getBranch() %></a></td>
	</tr>
<%	
}
%>
</table>
<%
}
if(p==0)
{
%>
<p class="center text-dark-blue">Sorry!No data found...</p>
<%} %>
</div>
</div>
</div>
</body>
</html>