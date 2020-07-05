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
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.kosmo.travelmaker.service.CityTagDTO;
import com.kosmo.travelmaker.service.CityTagService;
@Controller
public class VisionController {
	//서비스 주입
	@Resource(name="cityTagService")
	private CityTagService cityTagService;
	
	
	@ResponseBody
	@RequestMapping(value="/TravelMaker/Vision.kosmo",method=RequestMethod.POST)
	public Map Vision(@RequestParam("fileObj") MultipartFile file,HttpServletRequest req) throws IllegalStateException, IOException {
		System.out.println(file);
		String path= req.getSession().getServletContext().getRealPath("/resources/Upload");
		File f = new File(path+File.separator+file.getOriginalFilename());
		file.transferTo(f);
		//String a = GoogleVision.vision(path+File.separator+file.getOriginalFilename());
		//System.out.println("반환값:"+a);
		Map tags = new HashMap();
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
			    	 int score = (int)(annotation.getScore()*100);
			    	 
			    	 if(score >= 90) {
			    		 String tag = annotation.getDescription();
			    		 System.out.println("Description:"+tag);
			    		 System.out.println(score);
			    		 if(cityTagService.TagMatch(tag)) {
			    			 tags.put(tag,score);
			    		 }
			    	 }
			     }
		   }
 	
 		}
		catch(Exception e) {e.printStackTrace();}
		System.out.println("들어옴:6");
		
		return tags;

	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/TravelMaker/CityTag.kosmo",produces = "text/html; charset=UTF-8")
	public String CityTag(@RequestParam String tags) {
		
		String[] tagAr=tags.split(",");
		Map map = new HashMap();
		map.put("tagAr", tagAr);
		/*
		 * for(int i=0;i<tagAr.length;i++) { map.put("tag"+i, tagAr[i]); }
		 */
		List<CityTagDTO> citys=cityTagService.CityTag(map);
		for(CityTagDTO city:citys) {
			System.out.println(city.getCity_name());
			System.out.println(city.getCount());
			System.out.println(city.getCity_no());
			System.out.println(city.getCity_img());
			System.out.println(city.getCity_intro());
		}
		System.out.println(net.sf.json.JSONArray.fromObject(citys).toString());
		return net.sf.json.JSONArray.fromObject(citys).toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/TravelMaker/searchlist.kosmo", produces = "text/html; charset=UTF-8")
	public String searchList(@RequestParam String search_keyword) {
		List<String> list = null;
		/* String apiStatus = map.get("apiStatus").toString(); */
		JSONArray ja = new JSONArray();
		list = cityTagService.searchCityList(search_keyword);

		for(int i=0;i<list.size();i++) {
			ja.add(list.get(i));	
		}
		
		/*
		 * if (apiStatus.equals("0")) { list = mapService.searchHospitalList(map); for
		 * (int i = 0; i < list.size(); i++) { //
		 * ja.add(list.get(i).get("HOSP_NAME").toString() + "(" +
		 * list.get(i).get("ADDRESS").toString().substring(0, 2)+ ")");
		 * ja.add(list.get(i).get("HOSP_NAME").toString()); } } else if
		 * (apiStatus.equals("1") || apiStatus.equals("2")) { list =
		 * mapService.searchPharmacyList(map); for (int i = 0; i < list.size(); i++) {
		 * // ja.add(list.get(i).get("PHAR_NAME").toString() + "(" +
		 * list.get(i).get("ADDRESS").toString().substring(0, 2)+ ")");
		 * ja.add(list.get(i).get("PHAR_NAME").toString()); } } else {
		 * 
		 * }
		 */

		return ja.toJSONString();
	}

}
