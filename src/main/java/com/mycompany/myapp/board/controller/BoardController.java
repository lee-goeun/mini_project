package com.mycompany.myapp.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ModelAndView listProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addFormProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ModelAndView viewProduct(@RequestParam("productId") int productId, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity modProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity removeProduct(@RequestParam("productId") int productId,
								HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
