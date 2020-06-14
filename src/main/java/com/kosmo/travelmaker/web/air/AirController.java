package com.kosmo.travelmaker.web.air;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;
@Controller
@RequestMapping("/TravelMaker/")

public class AirController {


   @RequestMapping("AirSearch.kosmo")
   public String AirSearch(@RequestParam Map map,Model model) throws ResponseException {
      String departure=map.get("departure").toString();
      String arrival=map.get("arrival").toString();
      String departureDate=map.get("departureDate").toString();
      String returnDate=map.get("returnDate").toString();
      String adult=map.get("adult").toString();
      String children="0";
      if(map.get("children")!="") {
         children=map.get("children").toString();
      }
      System.out.println("map:"+map.get("departure"));
      System.out.println("map:"+map.get("arrival"));
      System.out.println("map:"+map.get("departureDate"));
      System.out.println("map:"+map.get("returnDate"));
      System.out.println("map:"+map.get("adult"));
      System.out.println("map:"+map.get("children"));
      Amadeus amadeus = Amadeus
               .builder("wmBCJo8VFo4AFp3nqXxlWbHWdZH8VqwP", "0Of0WvaAGgzG8pym")
               .build();
      
      FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
            
                Params.with("originLocationCode", departure)
                        .and("destinationLocationCode", arrival)
                        .and("departureDate", map.get("departureDate"))
                        .and("returnDate", map.get("returnDate"))
                        .and("adults", Integer.parseInt(adult))
                        .and("children",Integer.parseInt(children)));
                  
      System.out.println("flightOffersSearches"+flightOffersSearches[0].getItineraries()[0].getSegments()[0]);
      List<List< Map<String,String>>> list=new Vector<List<Map<String,String>>>();
      for(FlightOfferSearch offer:flightOffersSearches) {
         List<Map<String,String>> info=new Vector<Map<String,String>>();
            for(FlightOfferSearch.SearchSegment seg: offer.getItineraries()[0].getSegments()) {
               Map<String,String> maps=new HashMap<String,String>();
               maps.put("DTime",seg.getDeparture().getAt().toString());
               maps.put("Dcode",seg.getDeparture().getIataCode().toString());
               maps.put("ATime",seg.getArrival().getAt().toString());
               maps.put("Acode",seg.getArrival().getIataCode().toString());
               info.add(maps);
            }
            for(FlightOfferSearch.SearchSegment seg: offer.getItineraries()[1].getSegments()) {
               Map<String,String> maps=new HashMap<String,String>();
               maps.put("DTime",seg.getDeparture().getAt().toString());
               maps.put("Dcode",seg.getDeparture().getIataCode().toString());
               maps.put("ATime",seg.getArrival().getAt().toString());
               maps.put("Acode",seg.getArrival().getIataCode().toString());
               info.add(maps);
            }
            
            list.add(info);
      }
      
      model.addAttribute("list",list);
      model.addAttribute("flightOffersSearches",flightOffersSearches[0].toString());
      
      
      
      return "air/AirList.tiles";
   }
   
   //아마데우스 API 사용을 위한 자바 구문 
   @RequestMapping("AirList.kosmo")
   public String AirList() {
      
   return "air/AirList.tiles";   
   }
         
   @RequestMapping("AirView.kosmo")
   public String AirView() {
      return "air/AirView.tiles";
   }
   @RequestMapping("AirRes.kosmo")
   public String AirRes() {
      return "air/AirRes.tiles";
   }
}