package com.haohe.srm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.haohe.srm.dao.SupplierMapper;
import com.haohe.srm.dao.SupplierRankMapper;
import com.haohe.srm.dao.SupplierTypeMapper;
import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Supplier;
import com.haohe.srm.model.SupplierRank;
import com.haohe.srm.model.SupplierType;
import com.haohe.srm.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {
    
    @Autowired
    private SupplierMapper supplierMapper;
    
    @Autowired
    private SupplierTypeMapper supplierTypeMapper;
    
    @Autowired
    private SupplierRankMapper supplierRankMapper;

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectAll()
     */
    @Override
    public List<Map<String, Object>> selectAllSuppliers(PaginationTableInfo pti) {

		int offset = pti.getOffset();
		int limit = pti.getLimit();
    	RowBounds rowBounds = new RowBounds(offset,limit);
    	
    	String sFilter = null;
    	if (null != pti.getSearch()) {
    		sFilter = "%" + pti.getSearch() + "%";
    	} else {
    		sFilter = "%%";
    	}
    	
    	String sOrder = null;
    	if (null != pti.getSort()) {
    		sOrder = pti.getSort() + " " + pti.getOrder();
    	}
    	Map<String, String> paramMap = new HashMap<String, String>();
    	paramMap.put("sFilter", sFilter);
    	paramMap.put("sOrder", sOrder);
        return supplierMapper.selectAllSuppliers(paramMap, rowBounds);
    }

	@Override
	public int insert(Supplier supplier) {
		return supplierMapper.insert(supplier);
	}

	@Override
	public int updateByPrimaryKey(Supplier supplier) {
		return supplierMapper.updateByPrimaryKey(supplier);
	}

	@Override
	public int deleteByPrimaryKey(Integer supplierId) {
		return supplierMapper.deleteByPrimaryKey(supplierId);
	}

	@Override
	public Supplier selectByPrimaryKey(Integer supplierId) {
		return supplierMapper.selectByPrimaryKey(supplierId);
	}

	@Override
	public List<SupplierType> getAllSupplierTypes() {
		return supplierTypeMapper.selectAllSupplierTypes();
	}

	@Override
	public List<SupplierRank> getAllSupplierRanks() {
		return supplierRankMapper.selectAllSupplierRanks();
	}

	@Override
	public int SupplierQuantity(PaginationTableInfo pti) {
		
		String sFilter = null;
    	if (null != pti.getSearch()) {
    		sFilter = "%" + pti.getSearch() + "%";
    	} else {
    		sFilter = "%%";
    	}
    	
    	String sOrder = null;
    	if (null != pti.getSort()) {
    		sOrder = pti.getSort() + " " + pti.getOrder();
    	}
    	Map<String, String> paramMap = new HashMap<String, String>();
    	paramMap.put("sFilter", sFilter);
    	paramMap.put("sOrder", sOrder);
		return supplierMapper.selectTotalCount(paramMap);
	}

}
