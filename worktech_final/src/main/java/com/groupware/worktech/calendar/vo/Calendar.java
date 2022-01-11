package com.groupware.worktech.calendar.vo;

import java.sql.Timestamp;

public class Calendar {
	private int cal_no;
	private int cal_type;
	private Timestamp cal_start;
	private Timestamp cal_end;
	private String cal_title;
	private String cal_content;
	private String cal_writer;
	private int cal_delete;
	
	public Calendar() {}

	public Calendar(int cal_no, int cal_type, Timestamp cal_start, Timestamp cal_end, String cal_title,
			String cal_content, String cal_writer, int cal_delete) {
		super();
		this.cal_no = cal_no;
		this.cal_type = cal_type;
		this.cal_start = cal_start;
		this.cal_end = cal_end;
		this.cal_title = cal_title;
		this.cal_content = cal_content;
		this.cal_writer = cal_writer;
		this.cal_delete = cal_delete;
	}

	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public int getCal_type() {
		return cal_type;
	}

	public void setCal_type(int cal_type) {
		this.cal_type = cal_type;
	}

	public Timestamp getCal_start() {
		return cal_start;
	}

	public void setCal_start(Timestamp cal_start) {
		this.cal_start = cal_start;
	}

	public Timestamp getCal_end() {
		return cal_end;
	}

	public void setCal_end(Timestamp cal_end) {
		this.cal_end = cal_end;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public String getCal_content() {
		return cal_content;
	}

	public void setCal_content(String cal_content) {
		this.cal_content = cal_content;
	}

	public String getCal_writer() {
		return cal_writer;
	}

	public void setCal_writer(String cal_writer) {
		this.cal_writer = cal_writer;
	}

	public int getCal_delete() {
		return cal_delete;
	}

	public void setCal_delete(int cal_delete) {
		this.cal_delete = cal_delete;
	}

	@Override
	public String toString() {
		return "Calendar [cal_no=" + cal_no + ", cal_type=" + cal_type + ", cal_start=" + cal_start + ", cal_end="
				+ cal_end + ", cal_title=" + cal_title + ", cal_content=" + cal_content + ", cal_writer=" + cal_writer
				+ ", cal_delete=" + cal_delete + "]";
	}
	
	

}
