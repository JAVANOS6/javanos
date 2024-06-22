package com.javanos.project.community.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

import com.javanos.project.community.model.dto.CommunityDTO;
import com.javanos.project.community.model.service.CommunityService;


@WebServlet("/community/modify")
public class CommunityUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int communityNo = Integer.valueOf(request.getParameter("communityNo"));
		
		CommunityDTO community = new CommunityService().selectOneCommunity(communityNo);
		
		request.setAttribute("community", community);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/community/updateform.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int communityNo = Integer.valueOf(request.getParameter("communityNo"));
		String communityTitle = request.getParameter("communityTitle");
		String communityBody = request.getParameter("communityBody");
		LocalDateTime communityModifyDate =LocalDateTime.now();
		
		CommunityDTO updateCommunity = new CommunityDTO(communityNo,communityTitle,communityBody,communityModifyDate);
		
		int result = new CommunityService().updateCommunity(updateCommunity);
		
		if(result>0) {
			//성공
			
			
		}else {
			//실패
			
		}
		String path = "/community/modify?communityNo="+communityNo;
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
	
	

}
