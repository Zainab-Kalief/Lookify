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
		<a href="home">Home</a>		
	</div>
	<table>
		<tr>
			<td>Name</td>
			<td>Rating</td>
			<td>Action</td>
		<tr>
		 <c:forEach items="${ result }" var="song">
			<tr>
			<td> <a href="/find/${ song.id }"><c:out value="${ song.name }"/></a> </td>
			<td><c:out value="${ song.rating }"/> </td>
			<td><a href="/delete/${ song.id }" >delete</a></td>
			</tr>
		</c:forEach> 
	</table>
</body>
</html>