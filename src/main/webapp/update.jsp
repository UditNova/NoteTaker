<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- style and jsp -->
<%@include file="js_css.jsp"%>
</head>
<body>
	<div class="container">
		<!-- navbar module open -->
		<%@include file="navbar.jsp"%>
		<!-- navbar module close -->
		<br>
		

		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryProvider.getfactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		<form action="UpdateServlet" method="post">
			<div class="form-group">
				<h1>Edit note:</h1>
				<input type="text" value="<%= note.getId() %>" type="hidden" name="note_id">
			</div>
			<div class="form-group">
				<label for="title">Title: </label> <input required="required"
					type="text" class="form-control" id="title"
					placeholder="Enter title" name="note_title"
					value="<%=note.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="note_content">Note: </label>
				<textarea required="required" name="note_content"
					class="form-control" id="note_content"
					placeholder="Complete this by tomorrow." style="height: 200px"><%=note.getContent() %> 
					</textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</form>


	</div>


</body>
</html>