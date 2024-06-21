package com.javanos.project.community.model.dto;

import javax.tools.JavaCompiler;

public class PictureDTO implements java.io.Serializable{
	
	private int picNO;
	private String savedName;
	private String savedPath;
	private String fileType;
	private String thumbnailPath;
	private String picBoardStatus;
	private int communityNo;
	
	
	public PictureDTO() {
		super();
	}


	public PictureDTO(int picNO, String savedName, String savedPath, String fileType, String thumbnailPath,
			String picBoardStatus, int communityNo) {
		super();
		this.picNO = picNO;
		this.savedName = savedName;
		this.savedPath = savedPath;
		this.fileType = fileType;
		this.thumbnailPath = thumbnailPath;
		this.picBoardStatus = picBoardStatus;
		this.communityNo = communityNo;
	}


	public int getPicNO() {
		return picNO;
	}


	public void setPicNO(int picNO) {
		this.picNO = picNO;
	}


	public String getSavedName() {
		return savedName;
	}


	public void setSavedName(String savedName) {
		this.savedName = savedName;
	}


	public String getSavedPath() {
		return savedPath;
	}


	public void setSavedPath(String savedPath) {
		this.savedPath = savedPath;
	}


	public String getFileType() {
		return fileType;
	}


	public void setFileType(String fileType) {
		this.fileType = fileType;
	}


	public String getThumbnailPath() {
		return thumbnailPath;
	}


	public void setThumbnailPath(String thumbnailPath) {
		this.thumbnailPath = thumbnailPath;
	}


	public String getPicBoardStatus() {
		return picBoardStatus;
	}


	public void setPicBoardStatus(String picBoardStatus) {
		this.picBoardStatus = picBoardStatus;
	}


	public int getCommunityNo() {
		return communityNo;
	}


	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}


	@Override
	public String toString() {
		return "PictureDTO [picNO=" + picNO + ", savedName=" + savedName + ", savedPath=" + savedPath + ", fileType="
				+ fileType + ", thumbnailPath=" + thumbnailPath + ", picBoardStatus=" + picBoardStatus
				+ ", communityNo=" + communityNo + "]";
	}
	
	
	

}
