package com.example.library.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.library.domain.Note;
import com.example.library.domain.User;
import com.example.library.service.NoteService;

@Controller
public class MainController {

	@Autowired
	NoteService noteService;
	
	@GetMapping("/")
	public String greeting(Model model) {
		model.addAttribute("name", "World");
		return "greeting";
	}

	@GetMapping("/greeting")
	public String newGreeting(@RequestParam(name = "name", required = false, defaultValue = "DefaultName") String name, Model model) {
		String requestName = name;
		model.addAttribute("name", requestName);
		return "greeting";
	}
	
	@GetMapping("/main")
	public String showAllNotes(
			@RequestParam(required = false, defaultValue = "") String filter, 
			Model model
	) {
		List<Note> allNotes;
		
		if(filter != null && !filter.isEmpty()) {
			allNotes = noteService.readByHeader(filter);
		} else {
			allNotes = noteService.readAll();
		}
		
		model.addAttribute("allNotes", allNotes);
		model.addAttribute("filter", filter);
		
		return "main";
	}
	
	@PostMapping("/addNote")
	public String addNote(
			@AuthenticationPrincipal User user,
			@RequestParam String header,
			@RequestParam String text
	) {
		Note note = new Note(header, text, user);
		
		noteService.create(note);
		
		return "redirect:/main";
	}
}
