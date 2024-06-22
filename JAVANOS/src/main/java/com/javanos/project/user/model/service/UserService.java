package com.javanos.project.user.model.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.javanos.project.user.model.dao.UserDAO;
import com.javanos.project.user.model.dto.UserDTO;

import static com.javanos.project.common.mybatis.Template.getSqlSession;

public class UserService {

	private UserDAO userDAO;

	public int checkDupUserId(String userId) {
		SqlSession session = getSqlSession();
		userDAO = session.getMapper(UserDAO.class);

		int result = userDAO.selectCountByUserId(userId);

		session.close();
		return result;
	}

	public int registUser(UserDTO requestUser) {
		SqlSession session = getSqlSession();
		userDAO = session.getMapper(UserDAO.class);

		int result = userDAO.insertUser(requestUser);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public UserDTO loginCheck(UserDTO requestUser) {
		SqlSession session = getSqlSession();
		userDAO = session.getMapper(UserDAO.class);

		UserDTO loginUser = null;
		
		// 로그인 회원이 null이 아니고 비밀번호가 null이 아닌 경우에 로그인 처리
		if(requestUser != null && requestUser.getUserPwd() != null) {
			String planPwd = userDAO.selectPlainPwd(requestUser);
			
			// 로그인 요청한 원문 비밀번호와 저장되어있는 평문화 비밀번호가 일치하는지 확인 (admin계정)
			if (requestUser.getUserPwd() != null && planPwd != null && planPwd.equals(requestUser.getUserPwd())) {
				loginUser = userDAO.selectLoginUser(requestUser);
			} else {
				String encPwd = userDAO.selectEncryptedPwd(requestUser);
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				
				// 로그인 요청한 원문 비밀번호와 저장되어있는 암호화된 비밀번호가 일치하는지 확인
				// 비밀번호가 일치하는 경우에만 회원 정보를 조회
				if (passwordEncoder.matches(requestUser.getUserPwd(), encPwd)) {
					loginUser = userDAO.selectLoginUser(requestUser);
				}
			}
		}

		session.close();
		return loginUser;
	}
	
}