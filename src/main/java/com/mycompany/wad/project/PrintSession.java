/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template

 */
package com.mycompany.wad.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//Debugger for printing out data in a session.
//point any form action to this servlet when neccessary
@WebServlet("/PrintSess")
public class PrintSession extends HttpServlet {
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get the session object
        HttpSession session = request.getSession();
        
        // Print the session data
        out.println("<html><body>");
        out.println("<h2>Session Data:</h2>");
        out.println("<ul>");
        
        // Get all attribute names in the session
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String attributeName = attributeNames.nextElement();
            Object attributeValue = session.getAttribute(attributeName);
            out.println("<li><strong>" + attributeName + ":</strong> " + attributeValue.toString() + "</li>");
        }
        
        out.println("</ul>");
        out.println("</body></html>");
        
        out.close();
    }
}