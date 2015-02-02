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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="http://getbootstrap.com/assets/css/docs.min.css">
        <style type="text/css">
            body {
                width: 800px;
                margin: auto;}
            .bs-docs-header div{
                text-align: right;
            }
            ul{
                list-style: none;
                padding:  0;
            }
            </style>
        </head>
        <body>
            <div class="bs-docs-header">
            <h1>Results</h1>
        </div>
        <div class="bs-callout bs-callout-info">
            <ul>
                <%
                    List<Post> posts = (List<Post>) request.getAttribute("posts");
                    for (Post post : posts) {
                        String url = "http://stackoverflow.com/questions/" + post.getId();
                        out.println("<li>");
                        out.println("\t<a href=\"" + url + "\">" + post.getTitle() + "</a>\n");
                        out.println("</li>");
                    }
                %>
            </ul>
        </div>

        <footer class="bs-docs-footer">
            <p>Github projects</p>
            <ul>
                <li><a href="https://github.com/dburihabwa/web-stax">https://github.com/dburihabwa/web-stax</a></li>
                <li><a href="https://github.com/Lorel/stack_mining">https://github.com/Lorel/stack_mining</a></li>
                <li><a href="https://github.com/AlexTwX/DataMining">https://github.com/AlexTwX/DataMining</a></li>
            </ul>
        </footer>
    </body>
</html>
