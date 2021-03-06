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
            <h1 class="page-header">web-stax</h1>
            <div>Search for your stack trace in the latest stackoveflow dump</div>
        </div>

        <div class="bs-callout bs-callout-info">
            <form method = "POST" action = "stack">
                <div class="form-group">
                    <label for="stacktrace">What's your problem?</label>
                    <textarea class="form-control" name = "stacktrace" placeholder = "Your stack trace here!" required><%
                        String stacktrace = request.getParameter("stacktrace");
                        if (stacktrace != null && stacktrace.length() > 0) {
                            out.print(stacktrace);
                        }
                        %></textarea>
                </div>
                <input type ="submit" class="btn btn-primary btn-lg">
            </form>
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
