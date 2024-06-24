package com.javanos.project.community.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.javanos.project.community.model.dto.CommunityDTO;
import com.javanos.project.community.model.service.CommunityService;


@WebServlet("/community/insert")
public class CommunityInsertServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/community/insert.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String communityTitle = request.getParameter("communityTitle");
		String communityBody = request.getParameter("communityBody");
		int userNo = Integer.valueOf(request.getParameter("userNo"));
		
		String path = "";
		
		System.out.println(communityTitle.length()==0);
		
		
		//제목과 내용 둘 중에 하나만 비어도 등록이 안되게하기(둘다 작성해야 넘어갈 수 있음)
		if (communityTitle.length()==0|| communityBody.length()==0) {
			path = "/WEB-INF/views/common/fail.jsp";
			request.setAttribute("message", "제목이나 내용이 비어있습니다!!");
			request.setAttribute("code", "emptyTitleorBody");
		} else {
			CommunityDTO community = new CommunityDTO();
			community.setCommunityTitle(communityTitle);
			community.setCommunityBody(communityBody);
			community.setUserNo(userNo);
			
			int result = new CommunityService().insertCommunity(community);
			
			

			if(result>0) {
				path = "/WEB-INF/views/common/success.jsp";
				request.setAttribute("successCode", "communityInsert");
				request.setAttribute("message", "등록되었습니다!! :)");
				  
			}else {
				  path = "/WEB-INF/views/common/fail.jsp";
				  request.setAttribute("message", "게시판 작성에 실패하셨습니다.");
				  request.setAttribute("code", "communityInsert");

			}
		}
		
		request.getRequestDispatcher(path).forward(request, response);
		

	
	}

}
