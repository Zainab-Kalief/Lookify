<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
	
</style>
</head>
<body>
	<div>
		<a href="/add">Add New</a>
		<a href="/topfive">Top Song</a>
		<form action="/search" method="get">
			<input type="text" name="search">
			<input type="submit" value="search by artist">
		</form>
	</div>
	<table>
		<tr>
			<td>Name</td>
			<td>Rating</td>
			<td>Action</td>
		<tr>
		 <c:forEach items="${ songs }" var="song">
			<tr>
			<td> <a href="/find/${ song.id }"><c:out value="${ song.name }"/></a> </td>
			<td><c:out value="${ song.rating }"/> </td>
			<td><a href="/delete/${ song.id }" >delete</a></td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>