package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

	@RequestMapping("/usr/home/main")
	public String showMain() {
		return "/usr/home/main";
	}
	
	@RequestMapping("/usr/home/siteintro")
	public String showIntro() {
		return "/usr/home/siteintro";
	}
	

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}