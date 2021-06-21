<%@page import="bank.History"%>
<%@page import="java.util.List"%>
<%@page import="bank.BankDao"%>
<%@page import="bank.BankBean"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bank|Transaction History</title>
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
									<th class="cell100 column1">REF_ID</th>
									<th class="cell100 column2">To</th>
									<th class="cell100 column3">From</th>
									<th class="cell100 column4">Amount</th>
									<th class="cell100 column5">Date</th>
									<th class="cell100 column6">Time</th>
									
								</tr>
							</thead>
						</table>
					</div>

					<div class="table100-body js-pscroll">
						<table>
							<tbody>
								<%
BankDao d=new BankDao();
List<History> l=d.history();
for(History b:l)
{
	%>
	<tr class="row100 body">
									<td class="cell100 column1"><%=b.getRef_id() %></td>
									<td class="cell100 column2"><%=b.getTo() %></td>
									<td class="cell100 column3"><%=b.getFrom() %></td>
									<td class="cell100 column4"><%=b.getAmount() %></td>
									<td class="cell100 column5"><%=b.getDate() %></td>
									<td class="cell100 column6"><%=b.getTime() %></td>
									
									
								</tr>

    
	
	<% 
	
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