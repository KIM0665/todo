package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.TodayVO;
import com.keduit.mapper.TodayMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service // 스프링에서 비즈니스 로직을 담당하는 클래스를 지정하여 스프링 컨테이너에 빈으로 등록합니다.
@Log4j // 콘솔창 사용
@RequiredArgsConstructor // 클래스의 필수 인자를 받는 생성자를 자동으로 생성


public class TodayServiceimpl implements TodayService{
	
	@Autowired
	public TodayMapper mapper;

	@Override
	public List<TodayVO> allRead() {
		
		
		log.info("TodayServiceimpl------------+allRead");
		
		return mapper.allRead();
	}

	@Override
	public TodayVO oneRead(Long tno) {
		
		log.info("TodayServiceimpl------------+oneRead");
		return mapper.oneRead(tno);
		
	}

	@Override
	public int update(TodayVO vo) {
		log.info("TodayServiceimpl------------+update");
		return mapper.update(vo);
	}

	@Override
	public int delete(Long tno) {
		
		log.info("TodayServiceimpl------------+delete");
		
		return mapper.delete(tno);
	}

	@Override
	public int insert(TodayVO vo) {
		
		log.info("TodayServiceimpl------------+insert");
		
		return mapper.insert(vo);
	}


	

}
