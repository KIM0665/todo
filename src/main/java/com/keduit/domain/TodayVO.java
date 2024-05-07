package com.keduit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodayVO {

	
	private int tno;
	private String title;
	private Date dueDate;
	private String writer;
	private int finished;
}
