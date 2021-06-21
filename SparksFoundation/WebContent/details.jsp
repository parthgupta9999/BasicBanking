<%@page import="bank.BankBean"%>
<%@page import="bank.BankDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
								
							</thead>
						</table>
					</div>
<%
int id=Integer.parseInt(request.getParameter("id"));
HttpSession s=request.getSession();
s.setAttribute("id", id);
BankDao d=new BankDao();
BankBean b=d.details(id);
%>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
							
								<tr class="row100 body">
							<a><img src="user.png" width=20%></a>
							</tr>
								<tr class="row100 body">
									<td class="cell100 column1">ID</td>
									<td class="cell100 column2"><%=b.getId()  %></td>
									</tr>
								<tr class="row100 body">
									<td class="cell100 column1">Name</td>
									<td class="cell100 column2"><%=b.getName()  %></td>
									</tr>
								<tr class="row100 body">
									<td class="cell100 column1">Balance</td>
									<td class="cell100 column2"><span>&#36;</span><%=b.getBalance()  %></td>
									</tr>
								<tr class="row100 body">
									<td class="cell100 column1">Branch</td>
									<td class="cell100 column2"><%=b.getBranch()  %></td>
									</tr>
								<tr class="row100 body">
									<td class="cell100 column1">City</td>
										<td class="cell100 column2"><%=b.getCity()  %></td>
								</tr>
								<tr class="row100 body">
<td class="cell100 column1"><a href="transfer.jsp?id=<%=id%>">TRANSFER MONEY</a></td>
</tr>
							
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