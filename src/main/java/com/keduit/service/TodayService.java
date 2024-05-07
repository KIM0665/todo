package com.keduit.service;

import java.util.List;

import com.keduit.domain.TodayVO;

public interface TodayService {
	
	
	public List<TodayVO> allRead();
	
	
	public TodayVO oneRead(Long tno);
	
	
	public int update(TodayVO vo);
	
	
	public int delete(Long tno);
	
	public int insert(TodayVO vo);

}
