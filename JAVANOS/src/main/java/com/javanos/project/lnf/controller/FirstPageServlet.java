package com.javanos.project.lnf.controller;

import java.io.IOException;
import java.util.List;

import com.javanos.project.lnf.model.dao.LnfDAO;
import com.javanos.project.lnf.model.dto.StationDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/lnf/first")
	public class FirstPageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		// DB 데이터 가져오기
//		LnfDAO lnfDAO = new LnfDAO();
//		List<StationDTO> stationList = lnfDAO.firstPage();
//		request.setAttribute("stationList", stationList);
		request.getRequestDispatcher("/WEB-INF/views/lnf/first/firstPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
