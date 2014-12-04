package com.gennady.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.resnav.adp.ProcessInterLakes;
import com.resnav.adp.ProcessSturgeon;

@Controller 
public class Home {
	
	@Value( "${inputPathRN1}" )
	private String inputPathRN1;
	
	@Value( "${inputFileRN1}" )
	private String inputFileRN1;
	
	@Value( "${outputPathRN1}" )
	private String outputPathRN1;
	
	@Value( "${outputFileRN1}" )
	private String outputFileRN1;
	//////////////////////////////
	@Value( "${inputPathRN2}" )
	private String inputPathRN2;
	
	@Value( "${inputFileRN2}" )
	private String inputFileRN2;
	
	@Value( "${outputPathRN2}" )
	private String outputPathRN2;
	
	@Value( "${outputFileRN2}" )
	private String outputFileRN2;
	
	String message = "Welcome to your 1st ADP ResNav project !";  
	static Logger logger = Logger.getLogger(Home.class);
	
	private static String rn1 = "Sturgeon";
	private static String rn2 = "InterLakes";
	
	  
    @RequestMapping("/show**")  
    public ModelAndView showMessage(WebRequest webRequest) {
    	String fileDir = "", inputDir = "", company = "", uploadMsg = null; 
    	Map<String, String[]> urlMap = webRequest.getParameterMap();
    	for (String parameter: urlMap.keySet()) {
			String value = urlMap.get(parameter)[0];
			//logger.info("\tParameters[" + name + "] = " + value);
		    if ("company".equalsIgnoreCase(parameter)) {
		    	company = value;
		    } else if ("upload".equalsIgnoreCase(parameter)) {
		    	if ("ok".equals(value)) {
		    		uploadMsg = "You successfully uploaded the feed!";
		    	} else {
		    		uploadMsg = "You failed to upload the feed!";
		    	}
		    }
    	}
    	if (rn2.equalsIgnoreCase(company) || "Inter-Lakes".equalsIgnoreCase(company)) {
    		fileDir = outputPathRN2;
    		inputDir = inputPathRN2;
    		message = "Inter-Lakes feeds !";
    	} else {
    		fileDir = outputPathRN1;
    		inputDir = inputPathRN1;
    		message = "Sturgeon feeds !";
    	}
    	File dir = new File(fileDir);
    	HashMap<String, String> hmap = new HashMap<String, String>();
    	SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
    	if (dir.exists() && dir.isDirectory()) {
    	  	File[] files = dir.listFiles();
    	  	for (File file: files) {
    	  		if (file.isFile())
    	  			hmap.put(file.getName(), sdf.format(file.lastModified()));
    	  	}
    	}
    	
    	dir = new File(inputDir);
    	HashMap<String, String> hmapInput = new HashMap<String, String>();
    	if (dir.exists() && dir.isDirectory()) {
    	  	File[] files = dir.listFiles();
    	  	for (File file: files) {
    	  		if (file.isFile())
    	  			hmapInput.put(file.getName(), sdf.format(file.lastModified()));
    	  	}
    	}
        System.out.println("from controller imagesPath:"+outputPathRN2);  
        ModelAndView model = new ModelAndView("show");
        model.addObject("message", message);
        model.addObject("fileMap", hmap);
        model.addObject("company", company);
        if (uploadMsg != null) model.addObject("uploadMsg", uploadMsg);
        if (hmapInput.size() > 0) model.addObject("inputFileMap", hmapInput);
        return model;  
    }  
    
    @RequestMapping(value = "upload", method = RequestMethod.POST)  
    public String uploadFeed(@RequestParam("company") String company, @RequestParam("name") String name, 
            @RequestParam("file") MultipartFile file) {
    	logger.info("Home importFeed for company:"+company+", orig filename:"+file.getOriginalFilename());
    	String inputDir = "";
    	String uploadMsg = "fail";
    	if (name == null && "".equals(name)) 
    		return "redirect:/show?company=" + company +"&upload="+ uploadMsg ;
    	if (rn1.equalsIgnoreCase(company)) inputDir = inputPathRN1;
    	else if (rn2.equalsIgnoreCase(company)) inputDir = inputPathRN2;
    	else ;
    	if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                BufferedOutputStream stream = 
                        new BufferedOutputStream(new FileOutputStream(new File(inputDir+"/"+name)));
                stream.write(bytes);
                stream.close();
                //uploadMsg = "You successfully uploaded " + name + " into: "+inputDir+ "/" + name;
                uploadMsg = "ok";
            } catch (Exception e) {
            	//uploadMsg = "You failed to upload " + name + " => " + e.getMessage();
            	uploadMsg = "fail";
            }
        } else {
        	//uploadMsg = "You failed to upload " + name + " because the file was empty.";
        	uploadMsg = "fail";
        }
    	
    	//ModelAndView model = new ModelAndView("upload");
    	return "redirect:/import?company=" + company +"&name="+name+"&upload="+ uploadMsg ;
    }
    
    @RequestMapping(value = "/import", method = RequestMethod.GET)  
    public ModelAndView importFeed(@RequestParam("company") String company, 
    							@RequestParam("name") String name, @RequestParam("upload") String upload) {
    	ModelAndView model = new ModelAndView("import");
    	String uploadMsg = ("ok".equals(upload))?  "You successfully uploaded " + name :
    												"You failed to upload " + name;
    	model.addObject("message", uploadMsg);
    	model.addObject("company", company);
    	model.addObject("feed", name);
    	return model;
    }
    
    @RequestMapping(value = "/import", method = RequestMethod.POST)  
    public ModelAndView importFeed(@RequestParam("company") String company, @RequestParam("name") String name) {
    	String outputFeed = "Failed";
    	if (rn2.equalsIgnoreCase(company))
    		outputFeed = ProcessInterLakes.run(inputPathRN2+"/"+name, outputFileRN2, outputPathRN2);
    	else 
    		outputFeed = ProcessSturgeon.run(inputPathRN1+"/"+name, outputFileRN1, outputPathRN1);
    	String uploadMsg = (!"FAIL".equals(outputFeed))?  "Import was successfull!" : "Failed to import "+name;
    	
    	String fileName = outputFeed.substring(outputFeed.lastIndexOf("/")+1);
    	ModelAndView model = new ModelAndView("import");
    	model.addObject("message", uploadMsg);
    	model.addObject("company", company);
    	model.addObject("feed", outputFeed);
    	model.addObject("fileName", fileName);
    	return model;
    }
    
    @RequestMapping("/feed**")  
    public ModelAndView feed(@RequestParam("company") String company, @RequestParam("name") String name) {
    	String outputDir = "", line;
    	ArrayList<List<String>> alist = new ArrayList<List<String>>();
    	if (name == null && "".equals(name)) 
    		 logger.info("File name is empty");
    	if (rn1.equalsIgnoreCase(company)) outputDir = outputPathRN1;
    	else if (rn2.equalsIgnoreCase(company)) outputDir = outputPathRN2;
    	else ;
    	message = "Feed: "+name;
    	try {
    		logger.info("Read Feed File:"+outputDir+"/"+name);
    		BufferedReader br = new BufferedReader(new FileReader(outputDir+"/"+name));
    		
    		while ((line = br.readLine()) != null) {
    			//logger.info("LINE:"+line);
    			String[] data = line.split(",");
    			List<String> dataList = Arrays.asList(data);
    			alist.add(dataList);
    		}
    		br.close();
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	ModelAndView model = new ModelAndView("feed");
    	model.addObject("feedList", alist);
    	model.addObject("message", message);
    	return model;  
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.GET)  
    public ModelAndView deleteFeed(@RequestParam("company") String company, @RequestParam("name") String name) {
    	logger.info("Inside delete>>> company:"+company+", filename:"+name);
    	String fileName = "";
    	if (rn1.equalsIgnoreCase(company)) {
    		fileName = outputPathRN1 +"/"+name;
    	} else if (rn2.equalsIgnoreCase(company)) {
    		fileName = outputPathRN2 +"/"+name;
    	}
    	File f = new File(fileName);
    	if (f.exists()) f.delete();
    	else {
    		logger.error("Such file does not exist: "+fileName);
    	}
    	ModelAndView model = new ModelAndView("show");
    	model.addObject("company", company);
    	return model;
    }

}
