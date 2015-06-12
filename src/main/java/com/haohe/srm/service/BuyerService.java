package com.haohe.srm.service;

import com.haohe.srm.model.Buyer;

import java.util.List;
import java.util.Map;

public interface BuyerService {
    
    List<Map<String, Object>> selectAll(int offset, int limit);
    
    int insert(Buyer buyer);
    
    Buyer selectByPrimaryKey(Integer buyerId);
    
    int deleteByPrimaryKey(Integer buyerId);
    
    int updateByPrimaryKey(Buyer record);

}
