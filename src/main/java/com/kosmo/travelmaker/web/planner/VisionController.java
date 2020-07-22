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
		String path= req.getSession().getServletContext().getRealPath("/resources/Upload");
		File f = new File(path+File.separator+file.getOriginalFilename());
		file.transferTo(f);
		Map tags = new HashMap();
		 try {
			 ImageAnnotatorClient vision = ImageAnnotatorClient.create();
		   // The path to the image file to annotate
		   String fileName = path+File.separator+file.getOriginalFilename();
		   // Reads the image file into memory
		   Path path1 = Paths.get(fileName);
		   byte[] data = Files.readAllBytes(path1);
		   ByteString imgBytes = ByteString.copyFrom(data);
		   // Builds the image annotation request
		   List<AnnotateImageRequest> requests = new ArrayList<>();
		   Image img = Image.newBuilder().setContent(imgBytes).build();
		   Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		   AnnotateImageRequest request =
		       AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		   requests.add(request);
		   // Performs label detection on the image file
		   BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
		   List<AnnotateImageResponse> responses = response.getResponsesList();
		   for (AnnotateImageResponse res : responses) {
			   if (res.hasError()) {
			       return null;
			   }
			     for (EntityAnnotation annotation : res.getLabelAnnotationsList()) {
			    	 int score = (int)(annotation.getScore()*100);
			    	 if(score >= 90) {
			    		 String tag = annotation.getDescription();
			    		 if(cityTagService.TagMatch(tag)) {
			    			 tags.put(tag,score);
			    		 }
			    	 }
			     }
		   }
 		}
		catch(Exception e) {e.printStackTrace();}
		return tags;
	}
	@ResponseBody
	@RequestMapping(value="/TravelMaker/CityTag.kosmo",produces = "text/html; charset=UTF-8")
	public String CityTag(@RequestParam String tags) {
		String[] tagAr=tags.split(",");
		Map map = new HashMap();
		map.put("tagAr", tagAr);
		List<CityTagDTO> citys=cityTagService.CityTag(map);
		return net.sf.json.JSONArray.fromObject(citys).toString();
	}
	@ResponseBody
	@RequestMapping(value = "/TravelMaker/searchlist.kosmo", produces = "text/html; charset=UTF-8")
	public String searchList(@RequestParam String search_keyword) {
		List<String> list = null;
		JSONArray ja = new JSONArray();
		list = cityTagService.searchCityList(search_keyword);
		for(int i=0;i<list.size();i++) {
			ja.add(list.get(i));	
		}
		return ja.toJSONString();
	}
	@ResponseBody
	@RequestMapping(value = "/TravelMaker/checkcity.kosmo", produces = "text/html; charset=UTF-8")
	public String checkcity(@RequestParam String search_city) {
		Map map = new HashMap();
		JSONArray ja = new JSONArray();
		map = cityTagService.checkcity(search_city);
		return JSONObject.toJSONString(map);
	}
}
