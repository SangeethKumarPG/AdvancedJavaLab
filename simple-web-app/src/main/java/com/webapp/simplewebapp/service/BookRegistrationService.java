package com.webapp.simplewebapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webapp.simplewebapp.model.Book;
import com.webapp.simplewebapp.repository.BookRepository;

@Service
public class BookRegistrationService {
	@Autowired
	BookRepository bookRepository;
	
	public String addBook(Book book) {
		bookRepository.save(book);
		return "Book Added!";
	}
	
	public String deleteBookById(Long id) {
		bookRepository.deleteById(id);
		return "Book:"+id+"deleted";
	}
	
	public Optional<Book> findBookById(Long id) {
		return bookRepository.findById(id);
	}
	
	public List<Book> findAllBooks(){
		return bookRepository.findAll();
	}
	
	public String updateBook(Book book) {
		Optional<Book> currentBook = bookRepository.findById(book.getId());
		if(currentBook.isPresent()) {
			currentBook.get().setName(book.getName());
			currentBook.get().setAuthor(book.getAuthor());
			currentBook.get().setCategory(book.getCategory());
			bookRepository.save(currentBook.get());
		}else {
			return addBook(book);
		}
		return "Bookupdated";
		
	}
	
	
}
