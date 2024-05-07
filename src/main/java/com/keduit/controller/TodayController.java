package com.keduit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.keduit.domain.TodayVO;
import com.keduit.service.TodayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 스프링 MVC에서 컨트롤러 클래스를 지정합니다. Ex) jsp파일 이동 등등
@Log4j  // 콘솔창 사용
@RequiredArgsConstructor //  클래스의 필수 인자를 받는 생성자를 자동으로 생성@RequestMapping(“/board/*”) //특정 URL 패턴에 대한 요청을 해당 컨트롤러의 메서드로 매핑하여 처리
@RequestMapping("/today/*") //특정 URL 패턴에 대한 요청을 해당 컨트롤러의 메서드로 매핑하여 처리



public class TodayController {
	

	public final TodayService service;
	
	
	@GetMapping("/list")
	public void allRead (Model model){
		log.info("------list----");
		model.addAttribute("today",service.allRead());
		log.info("------list----");
		
	}
	

	
	@GetMapping("/get")
	public void get1(Long tno,Model model) {
		log.info("------get1----");
		model.addAttribute("today",service.oneRead(tno));
	}
	
	@GetMapping("/modify")
	public void modifyPage(Long tno,Model model) {
		log.info("------get1----");
		model.addAttribute("today",service.oneRead(tno));
	}
	
	@PostMapping("/modify")
	public String modify(TodayVO vo) {
		service.update(vo);
		return "redirect:/today/list";
		
	}
	
	
	@PostMapping("/remove")
	public String delete(Long tno) {
		service.delete(tno);
		return "redirect:/today/list";
		}
	
	@GetMapping("/register")
	public void insert() {}
	
	
	@PostMapping("/register")
	public String insert1(TodayVO vo) {
		
		service.insert(vo);
		return "redirect:/today/list";
	}
		
	
	
	
	
}
