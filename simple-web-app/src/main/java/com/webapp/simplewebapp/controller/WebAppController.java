package com.webapp.simplewebapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.webapp.simplewebapp.model.Book;
import com.webapp.simplewebapp.service.BookRegistrationService;

@Controller
@RequestMapping("/book")
public class WebAppController {

	@Autowired
	BookRegistrationService bookRegistrationService;

	@RequestMapping("/")
	public String goHome() {
		return "index";
	}

	@GetMapping("/add")
	public String addBookView(Model model) {
		model.addAttribute("book", new Book());
		return "addBook";
	}

	@PostMapping("/add")
	public RedirectView addBook(@ModelAttribute("book") Book book, RedirectAttributes redirectAttributes) {
		final RedirectView redirectView = new RedirectView("/book/add", true);
		String savedBook = bookRegistrationService.addBook(book);
		if (savedBook.equals("Book Added!")) {
			redirectAttributes.addFlashAttribute("addBookSuccess", true);
		} else {
			redirectAttributes.addFlashAttribute("addBookSuccess", false);
		}
		return redirectView;
	}

	@GetMapping("/view")
	public String getAllBooks(Model model) {
		model.addAttribute("books", bookRegistrationService.findAllBooks());
		return "viewAll";

	}

	@GetMapping("/delete/{id}")
	public String deleteBookById(@PathVariable Long id, Model model) {
		bookRegistrationService.deleteBookById(id);
		return "redirect:/book/view";
	}

	@GetMapping("/findbyid")
	public String getBook(Model model) {
		model.addAttribute("book", new Book());
		return "findById";
	}

	@PostMapping("/findbyid")
	public String getBookById(@RequestParam(name = "id", required = false) Long id, Model model) {

		if (id != 0) {
			if (bookRegistrationService.findBookById(id).isPresent()) {
				model.addAttribute("book", bookRegistrationService.findBookById(id).get());
			} else {
				model.addAttribute("errorMessage", "Book not found");
			}
		} else {
			model.addAttribute("errorMessage", "invalid id");
		}
		return "bookDetails";

	}

	@GetMapping("/updatebook/find")
	public String updateBook(@RequestParam(name = "id", required = false) Long id, Model model) {
		Book currentBook = bookRegistrationService.findBookById(id).get();
		model.addAttribute("book", currentBook);
		return "editBook";
	}

	@PostMapping("/update")
	public RedirectView updateBook(@ModelAttribute("book") Book book, Model model,
			RedirectAttributes redirectAttributes) {

		final RedirectView redirectView = new RedirectView("/book/updatebook/find?id=" + book.getId());
		if (bookRegistrationService.updateBook(book).equals("Bookupdated")) {
			redirectAttributes.addFlashAttribute("updateSuccess", true);
		} else {
			redirectAttributes.addFlashAttribute("updateSuccess", false);
		}
		return redirectView;
	}

}
