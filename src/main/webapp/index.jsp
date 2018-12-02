<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="src.SearchBean" %>
<%@page import="java.util.Map" %>
<%@page session="true" %>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <title>UT Search</title>
  </head>
  <body>
    <div class="container">
    <br/>
	<div class="row justify-content-center">
       <div class="col-12 col-md-10 col-lg-8">
           <form class="card card-sm" action=".\" method="get">
               <div class="card-body row no-gutters align-items-center">
                   <div class="col-auto">
                       <i class="fas fa-search h4 text-body"></i>
                   </div>
                   <!--end of col-->
                   <div class="col">
                       <input class="form-control form-control-lg form-control-borderless" type="search" name="search" placeholder="Search topics or keywords">
                   </div>
                   <!--end of col-->
                   <div class="col-auto">
                       <button class="btn btn-lg btn-success" type="submit">Search</button>
                   </div>
                   <!--end of col-->
               </div>
           </form>
			<h3>
			<%!
				SearchBean sb = new SearchBean();
			%>
			
			<%
			
				String s = request.getParameter("search");
				sb.setS(s);
				Map<String, Double> l = sb.getS();
				for(Map.Entry<String, Double> i: l.entrySet()){
					out.println("<a href='"+i.getKey()+"'>"+i.getKey()+"</a>");
					out.println("<br><br>");
				}
			
			%>
			</h3>
       </div>
       <!--end of col-->
   </div>
</div>
    
    
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>