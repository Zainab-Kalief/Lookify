package com.wura.lookify.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wura.lookify.models.Lookify;
import com.wura.lookify.services.LookifyService;

@Controller
public class LookifyController {
	private final LookifyService service;
	public LookifyController(LookifyService service) {
		this.service = service;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping("/home")
	public String home(Model model) {
		model.addAttribute("songs", service.all());
		return "home";
	}
	@RequestMapping("/add")
	public String addPage(Model model, @ModelAttribute("new") Lookify lookify) {
		List<Integer> ratings = new ArrayList<Integer>(Arrays.asList(1,2,3,4,5,6,7,8,9,10));
		model.addAttribute("ratings", ratings);
		return "new";
	}
	@PostMapping("/add")
	public String add(@Valid @ModelAttribute("new") Lookify lookify, BindingResult result) {
		if(result.hasErrors()) {
			return "new";
		}
		service.add(lookify);
		return "redirect:/home";
	}
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		service.delete(id);
		return "redirect:/home";
	}
	@RequestMapping("/find/{id}")
	public String view(@PathVariable("id") Long id, Model model) {
		model.addAttribute("song",service.find(id));
		return "view";
	}
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String search(@RequestParam(value="search") String name, Model model) {
		model.addAttribute("result", service.findByArtist(name));
		return "search";
	}
	@RequestMapping("/topfive")
	public String top(Model model) {
		model.addAttribute("top", service.findTopFive().subList(0, 5));
		return "topten";
	}
}


