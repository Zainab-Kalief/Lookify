<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="/">Dashboard</a>		
	</div>
	
	<form:form method="POST" action="/add" modelAttribute="new">
		<form:hidden path="id"/>
     <form:label path="name">Name	
     	<form:errors path="name"/>
     	<form:input path="name"/>
     </form:label><br>
     
     <form:label path="artist">Artist
     	<form:errors path="artist"/>
     	<form:input path="artist"/>
     </form:label><br>
     
     <form:select path="rating">Rating
     		<form:errors path="rating"/>
     		<form:options items="${ ratings }" type="numbers"></form:options>
     </form:select><br>
     
      <input type="submit" name="" value="Submit">
    </form:form> 
</body>
</html>