package com.mycompany.myapp.board.service;

import java.util.List;
import java.util.Map;

import com.mycompany.myapp.board.vo.ProductVO;

public interface BoardService {
	public List<ProductVO> listProducts() throws Exception;
	public int addNewProduct(Map articleMap) throws Exception;
	public ProductVO viewProduct(int ProductId) throws Exception;
	public void modProduct(Map productMap) throws Exception;
	public void removeProduct(int productId) throws Exception;
}
