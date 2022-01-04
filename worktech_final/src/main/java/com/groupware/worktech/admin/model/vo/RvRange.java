package com.groupware.worktech.admin.model.vo;

public class RvRange {
	private int rangeNo;
	private int pdNo;
	private int pdDNo;
	
	public RvRange() {}

	public RvRange(int rangeNo, int pdNo, int pdDNo) {
		super();
		this.rangeNo = rangeNo;
		this.pdNo = pdNo;
		this.pdDNo = pdDNo;
	}

	public int getRangeNo() {
		return rangeNo;
	}

	public void setRangeNo(int rangeNo) {
		this.rangeNo = rangeNo;
	}

	public int getPdNo() {
		return pdNo;
	}

	public void setPdNo(int pdNo) {
		this.pdNo = pdNo;
	}

	public int getPdDNo() {
		return pdDNo;
	}

	public void setPdDNo(int pdDNo) {
		this.pdDNo = pdDNo;
	}

	@Override
	public String toString() {
		return "RvRange [rangeNo=" + rangeNo + ", pdNo=" + pdNo + ", pdDNo=" + pdDNo + "]";
	}
}
