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
	<link rel="stylesheet" href="index.css">
    <title>UT Search</title>
  </head>
	<body>
<div class="row">
	<div class="col-8 float-left" >
		<form class="card card-sm search-class" action=".\" method="get" >
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
			
		<br>
		<%!
				SearchBean sb = new SearchBean();
		%>
		
		<%
				String s = request.getParameter("search");
				sb.setS(s);
				Map<String, Double> l = sb.getS();
				Map<String, String> c = sb.getContent();
				Map<String, String> t = sb.getTitle();
				for(Map.Entry<String, Double> i: l.entrySet()){
					out.println("<div style='padding-left:40px'>");
					out.println("<br>");
					out.println("<a id='title' style='text-overflow: ellipsis;'  href='"+i.getKey()+"'><h3 style='text-overflow: ellipsis;'>"+ t.get(i.getKey()) +"</h3></a>");
					out.println("<a id='url' style='text-overflow: ellipsis;' href='"+i.getKey()+"'><h6 style='text-overflow: ellipsis;' >"+i.getKey()+"</h6></a>");
					out.println("<h6 id='article'>"+ c.get(i.getKey()).substring(c.get(i.getKey()).length()/2) +"</h6><br>");
					out.println("</div>");
					
				}
		%>
		
		
			
	</div>
	
	<div class="col-4 float-right">
		<div class="logo">
			<img align="center" class="float-right center" src="ut.png" hight="200px" width="200px" hspace="100">
			<br><br>
			<h2 align="center"> Parsa heidary Moghadam </h2>
			<h2 align="center"> University of Tehran </h2>
			<h2 align="center"> Department of Algorithm and Computation </h2>
		</div>
	</div>
</div>
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>