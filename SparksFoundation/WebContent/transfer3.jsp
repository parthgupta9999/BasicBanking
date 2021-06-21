<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="bank.BankBean"%>
<%@page import="bank.BankDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="bank.BankDao"%>
<%@page import="bank.BankBean"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V04</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body>
<header class="header-section">
    <div class="header-top">
      <div class="container">
        <div class="row align-items-center">
          <!--  any pre head  -->
        </div>
      </div>
    </div>
    <div class="header-bottom">
      <div class="container">
        <nav class="navbar navbar-expand-lg p-0">
         <a class="navbar-brand" href="index.html"><h2>Basic <em> Banking System</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="menu-toggle"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            
          </div>
        </nav>
      </div>
    </div><!-- header-bottom end -->
  </header>
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				
					

					
				<div class="table100 ver2 m-b-110">
					<div class="table100-head">
						<table>
							<thead>
								<tr class="row100 head">
									<th class="cell100 column1">Money Transfer</th>
									<th class="cell100 column2"> </th>
									
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
<%
try{
	 SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
	 SimpleDateFormat formatte = new SimpleDateFormat("dd/MM/yyyy");  
	 SimpleDateFormat formatt = new SimpleDateFormat("HH:mm:ss");  
    Date date = new Date();  
   String datest=formatte.format(date);
   String timest=formatt.format(date);
int amount=Integer.parseInt(request.getParameter("amount"));

HttpSession s=request.getSession();
int Fid=(Integer)s.getAttribute("id");
BankDao d=new BankDao();
int Tid=Integer.parseInt(request.getParameter("Tid"));
BankBean b1=d.details(Tid);
BankBean b2=d.details(Fid);
int balance=b2.getBalance();
if(balance>amount)
{
	 
	int result =d.update(b2.getBalance()-amount,Fid) + d.update(b1.getBalance()+amount,Tid)+d.history(Fid, Tid,amount, datest,timest);;
	if(result==3)
		
	{
		%>
		
		<tr class="row100 body">
								<td class="cell100 column1">	<a><img src="success.png" width=20% Style="align:right"></a></td>
								<td class="cell100 column2">Money Transfer Successful at <%=formatter.format(date) %>. 
								</tr>
								
		<tr class="row100 body">
		<td class="cell100 column1"><a href="<%="transfer2.jsp?id="+Tid %>">Transfer More</a></td>
									<td class="cell100 column2"><a href="index.html">Log Out</a></td>
									</tr>
		
		
		<%
	}
	else
	{ %>
		<tr class="row100 body">
		<td class="cell100 column1">	<a><img src="cross.jpg" width=20% Style="align:right"></a></td>
		<td class="cell100 column2">Money Transfer Unsuccessful  . 
		
		</tr>
		<tr class="row100 body">
		<td class="cell100 column2"><a href="index.html">Log Out</a></td>
									</tr>
	
	<% }
	
}
else
{
	 RequestDispatcher rd=request.getRequestDispatcher("transfer2.jsp?id="+Tid);
	  	rd.include(request,response);
	   	out.println("\n"+"<script>window.alert('Your Account is Not Having required Balance to Transfer');</script>");

}}
catch(Exception e)
{
	e.printStackTrace();
}


%>




	
	
							</tbody>
						</table>
					</div>
				</div>

				
				
			</div>
		</div>
	</div>


<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			var ps = new PerfectScrollbar(this);

			$(window).on('resize', function(){
				ps.update();
			})
		});
			
		
	</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>