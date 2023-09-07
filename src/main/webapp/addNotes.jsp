<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@include file="js_css.jsp"%>
</head>
<body>
	<div class="container">

		<!-- navbar -->
		<%@include file="navbar.jsp"%>
		<br>

		<!-- form module open -->
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<h3>Add a note details here...</h3>
			</div>
			<div class="form-group">
				<label for="title">Title: </label> <input
					required="required" type="text" class="form-control" id="title"
					placeholder="Enter title" name="note_title">
			</div>
			<div class="form-group">
				<label for="note_content">Note: </label>
				<textarea required="required" name="note_content" class="form-control" id="note_content"
					placeholder="Complete this by tomorrow."
					style="height:200px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>

	</div>

</body>
</html>