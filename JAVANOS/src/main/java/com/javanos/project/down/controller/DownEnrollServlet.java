package com.javanos.project.down.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/down/enroll")
public class DownEnrollServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path = "/WEB-INF/views/down/DownEnrollForm.jsp";
		request.getRequestDispatcher(path).forward(request, response);
	
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

}
	
	
}
