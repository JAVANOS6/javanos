
package com.javanos.project.notice.model.dto;

import java.sql.Date;

import com.javanos.project.user.model.dto.UserDTO;

public class NoticeDTO implements java.io.Serializable {

	private int noticeNo;
	private UserDTO noticeWriter;
	private String noticeTitle;
	private String noticeBody;
	private Date noticeEnrollDate;
	private Date noticeModifyDate;
	private int noticeCount;
	private String noticeBoardStatus;
	
	public NoticeDTO() {
		super();
	}

	public NoticeDTO(int noticeNo, UserDTO noticeWriter, String noticeTitle, String noticeBody, Date noticeEnrollDate,
			Date noticeModifyDate, int noticeCount, String noticeBoardStatus) {
		super();
		this.noticeNo = noticeNo;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeBody = noticeBody;
		this.noticeEnrollDate = noticeEnrollDate;
		this.noticeModifyDate = noticeModifyDate;
		this.noticeCount = noticeCount;
		this.noticeBoardStatus = noticeBoardStatus;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public UserDTO getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(UserDTO noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeBody() {
		return noticeBody;
	}

	public void setNoticeBody(String noticeBody) {
		this.noticeBody = noticeBody;
	}

	public Date getNoticeEnrollDate() {
		return noticeEnrollDate;
	}

	public void setNoticeEnrollDate(Date noticeEnrollDate) {
		this.noticeEnrollDate = noticeEnrollDate;
	}

	public Date getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(Date noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getNoticeBoardStatus() {
		return noticeBoardStatus;
	}

	public void setNoticeBoardStatus(String noticeBoardStatus) {
		this.noticeBoardStatus = noticeBoardStatus;
	}

	@Override
	public String toString() {
		return "NoticeDTO [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle
				+ ", noticeBody=" + noticeBody + ", noticeEnrollDate=" + noticeEnrollDate + ", noticeModifyDate="
				+ noticeModifyDate + ", noticeCount=" + noticeCount + ", noticeBoardStatus=" + noticeBoardStatus + "]";
	}
	
	
	
	
	
}
