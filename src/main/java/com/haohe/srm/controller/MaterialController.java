package com.haohe.srm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haohe.srm.dto.PaginationTableInfo;
import com.haohe.srm.model.Material;
import com.haohe.srm.service.MaterialService;

/**
 * This is the FE call entry. FE call these web service and get data to display
 * in UI
 */
@Controller
@RequestMapping("material")
public class MaterialController {

	@Autowired
	private MaterialService materialService;

	@RequestMapping(value = "/view/main", method = RequestMethod.GET)
	public String viewMain() {
		return "material_main";
	}

	@ResponseBody
	@RequestMapping(value = "list", method = RequestMethod.GET, produces = "application/json")
	public Map<String, Object> list(PaginationTableInfo pti) {

		List<Map<String, Object>> materialList = materialService.selectAll(pti);

		int materialListTotal = materialService.selectAllCount(pti);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("rows", materialList);
		result.put("total", materialListTotal);

		return result;
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Material material) {
		if (null == material.getMaterialId()) {
			// material.setMaterialId(materialService.getMaxId() + 1);
			materialService.insert(material);
		} else {
			materialService.updateByPrimaryKey(material);
		}

		return "material_main";
	}

	@ResponseBody
	@RequestMapping(value = "/retrieve/{materialId}", method = RequestMethod.GET)
	public Material retrieve(@PathVariable("materialId") Integer materialId) {
		Material material = materialService.selectByPrimaryKey(materialId);

		return material;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("materialIds[]") List<Integer> materialIds) { 
		 materialService.deleteByPrimaryKeys(materialIds);
		return "success";
	}
}
