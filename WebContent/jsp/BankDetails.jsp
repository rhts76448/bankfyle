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
  <div class="card-4 center container content round-xxlarge padding-large" style="max-width:800px">
  <a href="index.jsp"><i class="fa fa-home left"></i></a>
  <b>
  Bank Details
  </b>
  </div>
  </div>
<div class="container content  padding-64" style="max-width:800px">
<%
bank ob=(bank)session.getAttribute("bankDetails");
if(ob.getName()!=null){
	%>
<div class="container content">
<div class="content">
<p class="text-cyan half left">Bank Name: </p>
<p class="half"><%= ob.getName() %></p>
</div>
<div class="content">
<p class="text-cyan half left">Branch: </p>
<p class="half"><%=ob.getBranch() %></p>
</div>
<div class="content">
<p class="text-cyan half left">IFSC Code: </p>
<p class="half"><%=ob.getIfsc() %></p>
</div>
<div class="content">
<p class="text-cyan half left">Address:</p>
<p class="half"><%=ob.getAddress() %></p>
</div>
</div>
<%}
else{
%>
<div class="container content center">
<p class="text-dark-blue">Please enter a valid ifsc code...</p>
</div>
<%
}
%>
</div>
</div>
</body>
</html>