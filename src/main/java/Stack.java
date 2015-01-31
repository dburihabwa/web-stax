/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import fr.lille1.idl.stackoverflow.parsers.StackTraceItf;
import fr.lille1.idl.stackoverflow.parsers.java.JavaStackTraceParser;
import fr.lille1.idl.stackoverflow.persistence.PostDatabase;
import fr.lille1.idl.stackoverflow.tables.Post;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dorian
 */
@WebServlet(urlPatterns = {"/stack/*"})
public class Stack extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Stack</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Stack at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/index.html").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String parameter = request.getParameter("stacktrace");
        InputStream is = getServletContext().getResourceAsStream("/WEB-INF/config.properties");
        fr.lille1.idl.stackoverflow.Configuration.getConfiguration().load(is);
        is.close();
        JavaStackTraceParser parser = new JavaStackTraceParser();
        List<StackTraceItf> stackTraces = parser.parseAll(parameter);
        PostDatabase database = null;
        try {
            database = PostDatabase.getInstance();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Stack.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Stack.class.getName()).log(Level.SEVERE, null, ex);
        }
        List<Post> allPosts = new ArrayList<>();
        for (StackTraceItf st : stackTraces) {
            try {
                allPosts.addAll(database.find(st));
            } catch (SQLException ex) {
                Logger.getLogger(Stack.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        request.setAttribute("posts", allPosts);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
