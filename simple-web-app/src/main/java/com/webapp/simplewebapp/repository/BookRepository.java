package com.webapp.simplewebapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.webapp.simplewebapp.model.Book;

public interface BookRepository extends JpaRepository<Book, Long>{

}
