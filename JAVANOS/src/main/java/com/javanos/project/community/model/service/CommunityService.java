package com.javanos.project.community.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.javanos.project.community.model.dao.CommunityDAO;
import com.javanos.project.community.model.dto.CommunityDTO;
import static com.javanos.project.common.mybatis.Template.getSqlSession;


public class CommunityService {

	private CommunityDAO communityDAO;
	
	public List<CommunityDTO> selectAllCommunityList() {
		SqlSession session = getSqlSession();
		communityDAO = session.getMapper(CommunityDAO.class);
		
		List<CommunityDTO> communityList = communityDAO.selectAllCommunityList();
		
		return communityList;
		
	}

}
