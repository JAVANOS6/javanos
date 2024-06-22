package com.javanos.project.community.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.javanos.project.community.model.dao.CommunityDAO;
import com.javanos.project.community.model.dto.CommunityDTO;

import jakarta.servlet.annotation.WebServlet;

import static com.javanos.project.common.mybatis.Template.getSqlSession;

public class CommunityService {

	private CommunityDAO communityDAO;
	
	public List<CommunityDTO> selectAllCommunityList() {
		SqlSession session = getSqlSession();
		communityDAO = session.getMapper(CommunityDAO.class);
		
		List<CommunityDTO> communityList = communityDAO.selectAllCommunityList();
		
		session.close();
		return communityList;
		
	}

	public CommunityDTO selectOneCommunity(int communityNo) {
		SqlSession session = getSqlSession();
		communityDAO = session.getMapper(CommunityDAO.class);
		
		CommunityDTO community  = communityDAO.selectOneCommunity(communityNo);
		session.close();
		return community;
	}

	public int updateCommunity(CommunityDTO updateCommunity) {
		SqlSession session = getSqlSession();
		
		communityDAO = session.getMapper(CommunityDAO.class);
		
		int result = communityDAO.updateCommunity(updateCommunity);
		
		
		
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		
		return result;
	}
	

}
