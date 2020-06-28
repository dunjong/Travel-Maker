package com.kosmo.travelmaker.web.planner;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;
import com.kosmo.travelmaker.service.CityTagService;
@Controller
public class VisionController {
	@Resource(name="cityTagSerivce")
	private CityTagService cityTagSerivce;
	
	
	@ResponseBody
	@RequestMapping(value="/TravelMaker/Vision.kosmo",method=RequestMethod.POST)
	public String Vision(@RequestParam("fileObj") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println(file);
		String path= req.getSession().getServletContext().getRealPath("/resources/Upload");
		File f = new File(path+File.separator+file.getOriginalFilename());
		file.transferTo(f);
		//String a = GoogleVision.vision(path+File.separator+file.getOriginalFilename());
		//System.out.println("반환값:"+a);
		
		 try {
			 ImageAnnotatorClient vision = ImageAnnotatorClient.create();
			 System.out.println("들어옴");
			 
		   // The path to the image file to annotate
		   String fileName = path+File.separator+file.getOriginalFilename();
		   System.out.println("들어옴1111");
			 
		   // Reads the image file into memory
		   Path path1 = Paths.get(fileName);
		   byte[] data = Files.readAllBytes(path1);
		   ByteString imgBytes = ByteString.copyFrom(data);
		   System.out.println("들어옴:2");
		   // Builds the image annotation request
		   List<AnnotateImageRequest> requests = new ArrayList<>();
		   Image img = Image.newBuilder().setContent(imgBytes).build();
		   Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		   AnnotateImageRequest request =
		       AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		   requests.add(request);
		   System.out.println("들어옴:request"+request);
		  
		   // Performs label detection on the image file
		   BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
		   System.out.println("들어옴:response"+response);
		   System.out.println("들어옴:three-1");
		   List<AnnotateImageResponse> responses = response.getResponsesList();
		  
		   System.out.println("들어옴:4");
		   
		   for (AnnotateImageResponse res : responses) {
			   System.out.println("들어옴:5");
			   if (res.hasError()) {
			       System.out.printf("Error: %s\n", res.getError().getMessage());
			       return null;
			     }
		
			     for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
					/*
					 * annotation .getAllFields() .forEach((k, v) -> System.out.printf("%s : %s\n",
					 * k, v.toString()));
					 */
			       //System.out.println(annotation.getAllFields().get("score").toString());
			    	 float score = annotation.getScore();
			    	 if(score >= 0.90) {
			    		 String tag = annotation.getDescription();
			    		 System.out.println("Description:"+tag);
			    		 System.out.println(score);
			    		 
			    		 
			    	 }
			    	 
			       
			     }
		   }
 	
 		}
		catch(Exception e) {e.printStackTrace();}
		 System.out.println("들어옴:6");
		
		return "report/submissionComplete";

	}
	
	
}
