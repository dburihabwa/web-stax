<%-- 
    Document   : result
    Created on : 29 janv. 2015, 22:09:50
    Author     : dorian
--%>

<%@page import="fr.lille1.idl.stackoverflow.tables.Post"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>web-stax | Results</title>
    </head>
    <body>
        <h1>Results:</h1>
        <ul>
            <%
                List<Post> posts = (List<Post>) request.getAttribute("posts");
                for (Post post: posts) {
                    String url = "http://stackoverflow.com/questions/" + post.getId();
                    out.println("<li>");
                    out.println("\t<a href=\"" + url + "\">" + post.getTitle() + "</a>\n");
                    out.println("</li>");
                }
            %>
        </ul>
    </body>
</html>
