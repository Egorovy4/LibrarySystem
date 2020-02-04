package com.example.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.library.dao.NoteRepository;
import com.example.library.domain.Note;

@Service
public class NoteService {

	@Autowired
	private NoteRepository noteRepository;

	public Note create(Note note) {
		return noteRepository.save(note);
	}

	public Note readById(Integer id) {
		return noteRepository.findById(id).get();
	}

	public List<Note> readAll() {
		return noteRepository.findAll();
	}

	public Note update(Note note) {
		return noteRepository.save(note);
	}

	public void deleteById(Integer id) {
		noteRepository.deleteById(id);
	}
	
	public List<Note> readByHeader(String header) {
		return noteRepository.findByHeader(header);
	}
}
