<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<!-- style and jsp -->
<%@include file="js_css.jsp"%>
</head>
<body>

	<div class="container">
		<!-- navbar module open -->
		<%@include file="navbar.jsp"%>
		<!-- navbar module close -->
		<br>
		<h2 class="text-uppercase">All notes:</h2>

		
		<%
		Session s = FactoryProvider.getfactory().openSession();
		Query q = s.createQuery("from Note");
		List<Note> l = q.list();
		for (Note note : l) {
			//out.print(note.getId() + " " + note.getTitle() + " <br>");
		%>
		<div class="row">
			<div class="col-md-12">
				<div class="card text-white bg-dark mb-3" style="max-width: auto;">
					<div class="card-body">
						<img alt="note" src="img/note.png" style="height:40px; float:right; witdth: 40px; position: hover;">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<div class="container text-center">
							<a href="update.jsp?note_id=<%=note.getId() %>" class="btn btn-primary"><img alt="update" src="img/editing.png" style="height:20px; width:20px;">Update</a>
							<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-primary"><img alt="delete" src="img/delete.png" style="height:20px; width:20px;">Delete</a>
						</div>
					</div>
				</div>
			</div>
		</div>
			
		<%
			
		}

		s.close();
		%>

	</div>

</body>
</html>