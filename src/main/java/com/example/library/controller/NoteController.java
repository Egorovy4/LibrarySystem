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
public class NoteController {

	@Autowired
	NoteService noteService;
	
	@GetMapping("/main")
	public String showAllNotes(Model model) {
		List<Note> allNotes = noteService.readAll();
		model.addAttribute("allNotes", allNotes);
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
	
	@PostMapping("/filter")
	public String filter(
			@RequestParam String filter, Model model
	) {
		List<Note> filteredNotes;
		
		if(filter != null && !filter.isEmpty()) {
			filteredNotes = noteService.readByHeader(filter);
		} else {
			filteredNotes = noteService.readAll();
		}
		
		System.out.println(filteredNotes);
		
		model.addAttribute("allNotes", filteredNotes);
		
		return "main";
	}
}
