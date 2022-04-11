package com.mycompany.myapp.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Propagation;

import com.mycompany.myapp.board.dao.BoardDAO;
import com.mycompany.myapp.board.vo.ProductVO;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	public BoardServiceImpl() {
	}

	@Override
	public List<ProductVO> listProducts() throws Exception {
		List<ProductVO> productList = boardDAO.SelectAllProductsList();
		return productList;
	}

	//단일 이미지 추가
	@Override
	public int addNewProduct(Map productMap) throws Exception {
		return boardDAO.insertNewProduct(productMap);
	}

	//단일 파일 보이기
	@Override
	public ProductVO viewProduct(int ProductId) throws Exception {
		ProductVO productVO = boardDAO.selectProduct(ProductId);
		return productVO;
	}

	@Override
	public void modProduct(Map productMap) throws Exception {
		boardDAO.updateProduct(productMap);
		
	}

	@Override
	public void removeProduct(int productId) throws Exception {
		boardDAO.deleteProduct(productId);
	}

}
