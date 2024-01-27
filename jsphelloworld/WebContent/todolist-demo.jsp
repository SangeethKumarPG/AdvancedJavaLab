<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>To do list</title>
</head>
<body>
	<form action="todolist-demo.jsp">
		Add new item: <input type="text" name="theItem">
		<input type="submit" value="submit">
	
	</form>
	<br>
	
	<%
	
		List<String> items = (List<String>)session.getAttribute("myToDoList");
		if(items == null){
			items = new ArrayList<String>();
			session.setAttribute("myToDoList", items);
		}
		String theItem = request.getParameter("theItem");
		if (theItem != null&&!theItem.equals("")){
			if(!items.contains(theItem.trim())){
				items.add(theItem);
			}
		}
		session.invalidate();
	%>
	<hr>
		<br>
		<b>Todo List items</b>
		<br>
		<ol>
			<%
				for(String tempItem : items){
					out.println("<li>"+tempItem+"</li>");
				}
			
			%>
		</ol>
	
	
</body>
</html>