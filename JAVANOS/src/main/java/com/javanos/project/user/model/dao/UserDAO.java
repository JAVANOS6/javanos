package com.javanos.project.user.model.dao;

import com.javanos.project.user.model.dto.UserDTO;

public interface UserDAO {
	
	int selectCountByUserId(String userId);

	int insertUser(UserDTO requestUser);
	
	String selectPlainPwd(UserDTO requestUser);

	String selectEncryptedPwd(UserDTO requestUser);

	UserDTO selectLoginUser(UserDTO requestUser);

}
