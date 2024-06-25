package com.javanos.project.lnf.model.dto;

public class StationDTO implements java.io.Serializable {
	
	private int staNo;
	private int staCode;
	private String staName;
	private String staLine;
	
	public StationDTO() {
		super();
	}

	public StationDTO(int staNo, int staCode, String staName, String staLine) {
		super();
		this.staNo = staNo;
		this.staCode = staCode;
		this.staName = staName;
		this.staLine = staLine;
	}

	public int getStaNo() {
		return staNo;
	}

	public void setStaNo(int staNo) {
		this.staNo = staNo;
	}

	public int getStaCode() {
		return staCode;
	}

	public void setStaCode(int staCode) {
		this.staCode = staCode;
	}

	public String getStaName() {
		return staName;
	}

	public void setStaName(String staName) {
		this.staName = staName;
	}

	public String getStaLine() {
		return staLine;
	}

	public void setStaLine(String staLine) {
		this.staLine = staLine;
	}

	@Override
	public String toString() {
		return "StationDTO [staNo=" + staNo + ", staCode=" + staCode + ", staName=" + staName + ", staLine=" + staLine
				+ "]";
	}
	
	

}