package com.javanos.project.lnf.controller;

import java.io.IOException;
import java.util.List;

import com.javanos.project.lnf.model.dto.LnfBoardDTO;
import com.javanos.project.lnf.model.service.LnfBoardService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/main")
public class MainBoardListServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<LnfBoardDTO> boardList = new LnfBoardService().selectAllBoardList();
		
		request.setAttribute("boardList", boardList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/lnf/page/boardList.jsp");
		rd.forward(request, response);
		
	}

}
