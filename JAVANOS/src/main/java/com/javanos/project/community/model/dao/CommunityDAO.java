package com.javanos.project.community.model.dao;

import java.util.List;

import com.javanos.project.community.model.dto.CommunityDTO;

public interface CommunityDAO {

	List<CommunityDTO> selectAllCommunityList();

}
