package com.haohe.srm.service;

import java.util.List;
import java.util.Map;

import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Supplier;
import com.haohe.srm.model.SupplierRank;
import com.haohe.srm.model.SupplierType;

public interface SupplierService {
    
    List<Map<String, Object>> selectAllSuppliers(PaginationTableInfo pti);

	int insert(Supplier supplier);

	int updateByPrimaryKey(Supplier supplier);

	int deleteByPrimaryKey(Integer supplierId);

	Supplier selectByPrimaryKey(Integer supplierId);

	List<SupplierType> getAllSupplierTypes();

	List<SupplierRank> getAllSupplierRanks();

	int SupplierQuantity(PaginationTableInfo pti);
}
