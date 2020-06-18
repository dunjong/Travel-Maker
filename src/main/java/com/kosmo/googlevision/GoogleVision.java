package com.kosmo.googlevision;

//Imports the Google Cloud client library
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class GoogleVision {
	
//public static void main(String... args) throws Exception {
	public static String  vision(String url) {
		// Instantiates a client
		 try {
			 ImageAnnotatorClient vision = ImageAnnotatorClient.create();
			 System.out.println("들어옴");
			 
		   // The path to the image file to annotate
		   String fileName = url;
		   System.out.println("들어옴:pat:"+url);
			 
		   // Reads the image file into memory
		   Path path = Paths.get(fileName);
		   byte[] data = Files.readAllBytes(path);
		   ByteString imgBytes = ByteString.copyFrom(data);
		   System.out.println("들어옴:2");
		   // Builds the image annotation request
		   List<AnnotateImageRequest> requests = new ArrayList<>();
		   Image img = Image.newBuilder().setContent(imgBytes).build();
		   Feature feat = Feature.newBuilder().setType(Type.LABEL_DETECTION).build();
		   AnnotateImageRequest request =
		       AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		   requests.add(request);
		   System.out.println("들어옴:three");
		  
		   // Performs label detection on the image file
		   BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
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
			       annotation
			           .getAllFields()
			           .forEach((k, v) -> System.out.printf("%s : %s\n", k, v.toString()));
			     }
		   }
 	
 		}
		catch(Exception e) {e.printStackTrace();}
		 System.out.println("들어옴:6");
   		return "asdasdk";

	}
}