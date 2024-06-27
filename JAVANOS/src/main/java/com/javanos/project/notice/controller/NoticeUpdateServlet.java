package com.javanos.project.notice.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.javanos.project.notice.model.dto.NoticeDTO;
import com.javanos.project.notice.model.service.NoticeService;
import com.javanos.project.user.model.dto.UserDTO;

@WebServlet("/notice/update")
public class NoticeUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		여기 요약
//		1. 클라가 get 요청 보냄
//		2. no 공지사항 번호 가져옴
//		3. 해당 공지사항의 상세정보 조회함
//		4. 조회된 공지사항 정보가 존재하면 수정페이지로 전달, 실패 시 실패메세지 보여줌
//		5. 최종: 클라는 공지사항 수정하는 페이지로 이동하게됨

//		공지사항 번호를 문자열로 받아 정수로 변환함 - no 변수에 저장
		int no = Integer.parseInt(request.getParameter("no"));

//		noticeService 객체 생성
		NoticeService noticeService = new NoticeService();
//		selectNoticeDetail 메소드 호출 - 공지사항번호에 해당하는 "상세정보" 를 조회, 결과를 notice 변수에 DTO로 저장함
		NoticeDTO notice = noticeService.selectNoticeDetail(no);

//		경로 저장할 변수 초기화해줌
		String path = "";
//		notice(상세정보)가 있을 경우
		if (notice != null) {
//			상세정보있을때 updateFrom페이지 경로 지정
			path = "/WEB-INF/views/notice/noticeUpdateForm.jsp";
//			조회된 상세정보 요청 속성에 추가??
			request.setAttribute("notice", notice);
		} else {
//			상세정보 
			path = "/WEB-INF/views/common/fail.jsp";
			request.setAttribute("message", "공지사항 수정용 조회하기 실패!");
		}

		request.getRequestDispatcher(path).forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 요청 파라미터에서 공지사항 정보 추출
		String noticeNo = request.getParameter("noticeNo");
		String title = request.getParameter("title");
		String body = request.getParameter("content");
		int writerUserNo = ((UserDTO) request.getSession().getAttribute("loginUser")).getUserNo();

		// NoticeDTO 객체 생성 및 데이터 설정
		NoticeDTO updateNotice = new NoticeDTO();
		updateNotice.setNoticeNo(writerUserNo);
		updateNotice.setNoticeTitle(title);
		updateNotice.setNoticeBody(body);
		updateNotice.setNoticeUserno(writerUserNo); // 공지 작성자 회원번호 넣음
		
		System.out.println("========");
		System.out.println(updateNotice);

		// NoticeService를 통해 공지사항 수정
		NoticeService noticeService = new NoticeService();
		int result = noticeService.updateNotice(updateNotice);
		System.out.println("servlet의 result " + result);

		// 응답 처리
		String path = "";
		if (result > 0) {
			// 수정 성공 시, 공지사항 목록 페이지로 리디렉션
			path = "/WEB-INF/views/common/success.jsp";
			request.setAttribute("successCode", "updateNotice");
		} else {
			// 수정 실패 시, 에러 페이지로 포워딩
			path = "/WEB-INF/views/common/fail.jsp";
			request.setAttribute("message", "공지사항 수정에 실패했습니다.");

		}
		request.getRequestDispatcher(path).forward(request, response);

	}

}
