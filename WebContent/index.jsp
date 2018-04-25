<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.bankfyle.db.CRUD" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Get Bank Details</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">
<%
String[] bank=CRUD.getBank();
%>
<script>
var jsArr = new Array();
<%
for(int i=0;i<bank.length;i++)
{
%>
jsArr[<%=i%>]='<%=bank[i]%>';
<%
}
%>
function bodyLoad()//used to assign all the java String array  to javaScript array...
{
bank=document.getElementById("bank");

for(var i=0; i<jsArr.length; i++)
{
   var opt = document.createElement("option");
   opt.text=jsArr[i];
   opt.value=jsArr[i];
   bank.appendChild(opt);
}
}
function selectChk()
{
	bank= document.getElementById("bank").value;
	
	if(bank=="-1")
		{
		alert("please choose a bank");
		v=false;
		}
	else
		{
		v=true;
		}
	return v;
}
function chkIfsc()
{
	ifsc=document.getElementById("ifsc").value;
	if(ifsc.length!=11)
		{
		alert("please enter a valid ifsc code...");
		return flase;
		
		}
	else 
		{
		return true;
		}
}
</script>
</head>
<body onload="bodyLoad()">
<div class="content" style="max-width:2000px;margin-top:46px">
 <div class="bar cyan card-2 text-white">
  <div class="card-4 center container content round-xxlarge padding-large" style="max-width:800px"><b>
  Get Bank Details
  </b>
  </div>
  </div>
<div class="container center content  padding-64" style="max-width:800px">
<div class="container content">
<form method="post" action="./BankDetails">
<span class="text-white input content cyan round-xxlarge padding-small"><b>Get Details by IFSC Code</b></span>
<br>
<span>
<input type="text" class="input text-cyan round-xxlarge" name="ifsc" id="ifsc" placeholder="Enter the IFSC code here" required="">
<br>
<span>
<b>
<input type="submit" class="round-xlarge button cyan text-white" value="Get Details" onclick="return chkIfsc()">
</b></span>
</span>
</form>
</div>
<br>
<div class="container content">
<form method="get" action="./BranchList">
<span class="text-white input content cyan round-xxlarge padding-small"><b>Bank Branches In a City</b></span>
<br>
<Span>
<select name="bank" id="bank" class="select text-cyan"><option value="-1">Choose a Bank</option></select>
</Span>
<br>
<span>
<input type="text" class="input text-cyan round-xxlarge" name="city" id="city" placeholder="Enter the city name" required="">
</Span>
<br>
<span>
<b>
<input type="submit" class="round-xlarge button cyan text-white" value="Submit" onclick="return selectChk()">
</b></span>
</form>
</div>

</div>
</div>
</body>
</html>