package it.corso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import it.corso.model.Utente;
import it.corso.service.UtenteService;
import jakarta.validation.Valid;

//localhost:8080
@Controller
@RequestMapping("/")
public class IndexController {
	
	@Autowired
	private UtenteService utenteService;
	
	@GetMapping
	public String getPage(Model model) {
		
		Utente utente=new Utente(); //commento prova
		//utente.setNome("Laura");
		//utente.setEta(45);
		//utente.setUsername("abc");
		//utente.setPassword("def");
		
		
		model.addAttribute ("utente", utente); //per commit
		
		return "index";
				
	}
	
	@PostMapping
	public String formManager(@Valid @ModelAttribute("utente")Utente utente, BindingResult result) {
		if(result.hasErrors()) {
			return "index";
		}
		utenteService.registrazioneUtente(utente);
		
		
		return "redirect:/";

	}
}	
