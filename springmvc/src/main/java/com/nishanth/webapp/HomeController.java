package com.nishanth.webapp;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.ModelMap;

@Controller
@RequestMapping("/front")
public class HomeController{

	private static final String FRONT_END = "front_end";
	private static final String BACK_END = "back_end";

	@RequestMapping(method = RequestMethod.GET)
	public void printHello(ModelMap model, HttpServletRequest httpReq) 
	{
		List<String> list = new ArrayList<String>();
		InputStream inputStream = this.getClass().getClassLoader()
                .getResourceAsStream("frontEnd.txt");
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String line;
        try {
			while ((line = reader.readLine()) != null) {
				list.add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute(FRONT_END, list);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String postCall(ModelMap model, HttpServletRequest httpReq) 
	{
		List<String> list = new ArrayList<String>();
		InputStream inputStream = this.getClass().getClassLoader()
                .getResourceAsStream("backEnd.txt");
		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String line;
        try {
			while ((line = reader.readLine()) != null) {
				list.add(line);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		model.addAttribute(BACK_END, list);
		return "back";
	}

}