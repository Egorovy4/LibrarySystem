package com.example.library.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.library.domain.Note;

@Repository
public interface NoteRepository extends JpaRepository<Note, Integer> {
	List<Note> findByHeader(String header);
}
