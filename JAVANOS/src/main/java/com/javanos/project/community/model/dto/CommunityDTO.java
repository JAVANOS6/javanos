package com.javanos.project.community.model.dto;

import java.sql.Date;
import java.util.List;

import com.javanos.project.user.model.dto.UserDTO;

public class CommunityDTO implements java.io.Serializable{

	private int communityNo;
	private String communityTtile;
	private String communityBody;
	private String communityCount;
	private Date communityEnrollDate;
	private Date communityModifyDate;
	private char communityBoardStatus;
	private int userNo;
	private UserDTO user;
	private List<PictureDTO> pictureList;
	
	public CommunityDTO() {
		super();
	}

	public CommunityDTO(int communityNo, String communityTtile, String communityBody, String communityCount,
			Date communityEnrollDate, Date communityModifyDate, char communityBoardStatus, int userNo, UserDTO user,
			List<PictureDTO> pictureList) {
		super();
		this.communityNo = communityNo;
		this.communityTtile = communityTtile;
		this.communityBody = communityBody;
		this.communityCount = communityCount;
		this.communityEnrollDate = communityEnrollDate;
		this.communityModifyDate = communityModifyDate;
		this.communityBoardStatus = communityBoardStatus;
		this.userNo = userNo;
		this.user = user;
		this.pictureList = pictureList;
	}

	public int getCommunityNo() {
		return communityNo;
	}

	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}

	public String getCommunityTtile() {
		return communityTtile;
	}

	public void setCommunityTtile(String communityTtile) {
		this.communityTtile = communityTtile;
	}

	public String getCommunityBody() {
		return communityBody;
	}

	public void setCommunityBody(String communityBody) {
		this.communityBody = communityBody;
	}

	public String getCommunityCount() {
		return communityCount;
	}

	public void setCommunityCount(String communityCount) {
		this.communityCount = communityCount;
	}

	public Date getCommunityEnrollDate() {
		return communityEnrollDate;
	}

	public void setCommunityEnrollDate(Date communityEnrollDate) {
		this.communityEnrollDate = communityEnrollDate;
	}

	public Date getCommunityModifyDate() {
		return communityModifyDate;
	}

	public void setCommunityModifyDate(Date communityModifyDate) {
		this.communityModifyDate = communityModifyDate;
	}

	public char getCommunityBoardStatus() {
		return communityBoardStatus;
	}

	public void setCommunityBoardStatus(char communityBoardStatus) {
		this.communityBoardStatus = communityBoardStatus;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public List<PictureDTO> getPictureList() {
		return pictureList;
	}

	public void setPictureList(List<PictureDTO> pictureList) {
		this.pictureList = pictureList;
	}

	@Override
	public String toString() {
		return "CommunityDTO [communityNo=" + communityNo + ", communityTtile=" + communityTtile + ", communityBody="
				+ communityBody + ", communityCount=" + communityCount + ", communityEnrollDate=" + communityEnrollDate
				+ ", communityModifyDate=" + communityModifyDate + ", communityBoardStatus=" + communityBoardStatus
				+ ", userNo=" + userNo + ", user=" + user + ", pictureList=" + pictureList + "]";
	}

	
	
	
	
	
}
