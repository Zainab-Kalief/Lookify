<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<div>
		<a href="home">Home</a>		
	</div>
	
	<div>
		<c:forEach items="${ top }" var="song">
			
			<p><span> <a href="/find/${ song.id }"><c:out value="${ song.name }"/></a> </span>
			<span><c:out value="${ song.rating }"/> </span>
			<span><a href="/delete/${ song.id }" >delete</a></span></p>
		</c:forEach> 
	</div>