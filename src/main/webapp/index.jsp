<%-- 
    Document   : index
    Created on : 2 févr. 2015, 15:54:57
    Author     : dorian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <title>web-stax</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>web-stax</h1>
        <p>Search for your stack trace in the latest stackoveflow dump</p>
        <form method = "POST" action = "stack">
            <textarea name = "stacktrace" placeholder = "Your stack trace here!" required><%
                    String stacktrace = request.getParameter("stacktrace");
                    if (stacktrace != null && stacktrace.length() > 0) {
                        out.print(stacktrace);
                    }
                %></textarea>
            <br>
            <input type ="submit">
        </form>
    </body>
</html>
