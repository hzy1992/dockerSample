package com.hzy.sportsman.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	Map<String, ArrayList<String>> prjurls = new HashMap<String, ArrayList<String>>();

	@RequestMapping(value = "/projpush")
	public ModelAndView projpush(@RequestParam("prjurl") String prjurl) {
		if (!prjurls.containsKey(prjurl)) {
			prjurls.put(prjurl, new ArrayList<String>());
		} else {
			prjurls.get(prjurl).clear();
		}
		System.out.println("pushok");
		return new ModelAndView("pushok.jsp");
	}

	@RequestMapping(value = "/queryStatus")
	public void queryStatus(@RequestParam("bizname") String bizname, HttpServletResponse res) {
		System.out.println("queryStatus --" + bizname);
		List<String> prjs = new ArrayList<String>();
		Set<Entry<String, ArrayList<String>>> entrySet = prjurls.entrySet();
		for (Entry<String, ArrayList<String>> entry : entrySet) {
			if (!entry.getValue().contains(bizname)) {
				prjs.add(bizname);
				entry.getValue().add(bizname);
			}
		}
		try {
			if (prjs.size() != 0)
				res.getWriter().print(prjs.get(0));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
