package com.haohe.srm.controller;

import com.haohe.srm.model.Gender;
import com.haohe.srm.service.GenderService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 */
@Controller
@RequestMapping("gender")
public class GenderController {

    @Autowired
    private GenderService genderService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
    public List<Gender> list() {
        List<Gender> genderList = genderService.selectAll();
        return genderList;
    }

}
