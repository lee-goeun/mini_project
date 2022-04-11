package com.mycompany.myapp.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mycompany.myapp.board.vo.ProductVO;

public interface BoardDAO {
	public List SelectAllProductsList() throws DataAccessException;
	public int insertNewProduct(Map<String, Object> productMap) throws DataAccessException;
	
	public ProductVO selectProduct(int productId) throws DataAccessException;
	public void updateProduct(Map<String, Object> productMap) throws DataAccessException;
	public void deleteProduct(int productId) throws DataAccessException;
	public List selectImageFileList(int productId) throws DataAccessException;

}
