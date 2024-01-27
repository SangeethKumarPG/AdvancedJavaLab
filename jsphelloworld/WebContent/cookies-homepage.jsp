<html>
<head>
<title>Cookie home page</title>


</head>
<body>
	<h3>Training Portal</h3>

	<%
		
			String favLang = "Java";
			Cookie[] theCookies = request.getCookies();
			
			if(theCookies != null){
				for(Cookie tempCookie : theCookies){
					if ("myApp.favouriteLanguage".equals(tempCookie.getName())){
						favLang = tempCookie.getValue();
						break;
					}
				}
			}
		
		
		%>
	<h4>New books for <%= favLang %></h4>
	<ul>
		<li>Something</li>
		<li>Something</li>
	</ul>
		<h4>Latest news for for <%= favLang %></h4>
	<ul>
		<li>Something</li>
		<li>Something</li>
	</ul>
		<h4>Hot jobs for <%= favLang %></h4>
	<ul>
		<li>Something</li>
		<li>Something</li>
	</ul>
	<hr>
	<a href="cookies-personalized-form.html">Personlaize this page</a>
</body>
</html>