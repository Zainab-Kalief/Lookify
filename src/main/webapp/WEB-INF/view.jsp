<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>

<body>
	<a href="/home">Home</a>
	<h3>Title: <c:out   value = "${ song.name }"/> </h3>
	<h3>Artist: <c:out   value = "${ song.artist }"/> </h3>
	<h3>Rating: <c:out   value = "${ song.rating }"/> </h3>
	<a href="/delete/${ song.id }" >delete</a>
</body>
</html>