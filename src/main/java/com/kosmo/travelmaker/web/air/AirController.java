package com.kosmo.travelmaker.web.air;

import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;
import com.amadeus.resources.FlightOfferSearch.SearchPrice;
import com.amadeus.resources.FlightOfferSearch.SearchSegment;
import com.amadeus.resources.FlightPrice;

@Controller
@RequestMapping("/TravelMaker/")

public class AirController {

	// 아마데우스 API 사용을 위한 자바 구문
	@RequestMapping("AirSearch.kosmo")
	public String AirSearch(@RequestParam Map map, Model model) throws ResponseException {
		String departure = map.get("departure").toString();
		String arrival = map.get("arrival").toString();
		String departureDate = map.get("departureDate").toString();
		String returnDate = map.get("returnDate").toString();
		String adult = map.get("adult").toString();
		String children = "0";
		if (map.get("children") != "") {
			children = map.get("children").toString();
		}
//		System.out.println("map:" + map.get("departure"));
//		System.out.println("map:" + map.get("arrival"));
//		System.out.println("map:" + map.get("departureDate"));
//		System.out.println("map:" + map.get("returnDate"));
//		System.out.println("map:" + map.get("adult"));
//		System.out.println("map:" + map.get("children"));
		Amadeus amadeus = Amadeus.builder("wmBCJo8VFo4AFp3nqXxlWbHWdZH8VqwP", "0Of0WvaAGgzG8pym").build();

		FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
				Params.with("originLocationCode", departure)
						.and("destinationLocationCode", arrival)
						.and("departureDate", map.get("departureDate"))
						.and("returnDate", map.get("returnDate"))
						.and("adults", Integer.parseInt(adult))
						.and("max", 7)
						.and("currencyCode", "KRW")
						.and("children", Integer.parseInt(children)));
		String body = flightOffersSearches[0].getResponse().getBody();
		System.out.println(body);
//      System.out.println("flightOffersSearches"+flightOffersSearches[0].getItineraries()[0].getSegments()[0]);
//      System.out.println("flightoffersSearches"+flightOffersSearches[0].getPrice());
		List<Map> list = new Vector<Map>();
			
		for (FlightOfferSearch offer : flightOffersSearches) {
			System.out.println(offer.getItineraries()[0].getSegments().length);
			for (int k = 0; k < offer.getItineraries().length; k++) {
				
				for (int i = 0; i < offer.getItineraries()[k].getSegments().length; i++) {	
					
					String[] gyeongUName = new String[offer.getItineraries()[k].getSegments().length];//경유지이름넣는방의 크기를 경유지 숫자만큼 생성
					int gyeongUCount = offer.getItineraries()[k].getSegments().length - 1;//경유 횟수
					SearchSegment fSeg = offer.getItineraries()[k].getSegments()[i];
					SearchSegment lSeg = offer.getItineraries()[k].getSegments()[offer.getItineraries()[i].getSegments().length - 1];
					String chul = fSeg.getDeparture().toString();//출발
					String chak = lSeg.getArrival().toString();//도착
					gyeongUName[i] = (offer.getItineraries()[k].getSegments()[i].getDeparture().toString());//배열의 각방에 출발지이름을 넣음
					//SearchPrice price = offer.getTravelerPricings()[k].getPrice();
					//String Totvia = offer.getItineraries()[k].getDuration().toString();
					
					//System.out.println("결과1:"+fSeg);
    //      		System.out.println("결과2:"+lSeg);
					
					Map maps = new HashMap();
	//     	   		System.out.println(origin.getDeparture());	
	//        		System.out.println(destination.getArrival());
	//      	    System.out.println(base.getBase());
	//      	    System.out.println(total.getTotal());
	//      	    System.out.println("--------------");
	
	//        	    System.out.println("출발지에서 출발:"+offer.getItineraries()[0].getSegments()[0].getDeparture());
	//        	    System.out.println("출발(경유):"+offer.getItineraries()[0].getSegments()[0].getArrival());
	//        	    System.out.println("출발지에서 도착:"+offer.getItineraries()[0].getSegments()[0].getArrival());
	//        	    System.out.println("base:기본가?최저가?:"+offer.getTravelerPricings()[0].getPrice().getBase());
	//        	    System.out.println("total:총금액:"+offer.getTravelerPricings()[0].getPrice().getTotal());
					
					maps.put("Dtime", fSeg.getDeparture().getAt().toString());
					maps.put("Dcode", fSeg.getDeparture().getIataCode().toString());
					maps.put("Dvia", lSeg.getDeparture().getIataCode().toString());
					maps.put("Devia",fSeg.getDuration());
					maps.put("Atime", fSeg.getArrival().getAt().toString());
					maps.put("Acode", lSeg.getArrival().getIataCode().toString());
					maps.put("Avia", fSeg.getArrival().getIataCode().toString());
					maps.put("Arvia",lSeg.getDuration());
					//maps.put("base", (Double.toString(price.getBase()).split("\\.")[k]));
					//maps.put("total", (Double.toString(price.getTotal()).split("\\.")[k]));
					//maps.put("Tovia",Totvia);
					maps.put("chul", chul);
					maps.put("chak", chak);
					maps.put("gyeongUCount", gyeongUCount);
					maps.put("gyeongUName", gyeongUName);
					list.add(maps);
					}
				
			}
		}
		Map<Integer,Boolean> eqInSeg = new HashMap<Integer,Boolean>();
//		for(int l=0;l<list.size();l++){
//			Map test = list.get(l);
//			String tDTime = (String)test.get("DTime");
//			String tDcode = (String)test.get("Dcode");
//			String tDvia = (String)test.get("Dvia");
//			String tATime = (String)test.get("ATime");
//			String tAcode = (String)test.get("Acode");
//			String tAvia = (String)test.get("Avia");
//			String tbase = (String)test.get("base");
//			String ttotal = (String)test.get("total");
//			String tchul = (String)test.get("chul");
//			String tchak = (String)test.get("chak");
//			String tgyeongUCount = test.get("gyeongUCount").toString();
//			for(int m=l+1;m<list.size()||eqInSeg.get(l)==true;m++) {
//				 Map test2 = list.get(m);
//				 String tDTime2 = (String)test2.get("DTime");
//				 String tDcode2 = (String)test2.get("Dcode");
//				 String tDvia2 = (String)test2.get("Dvia");
//				 String tATime2 = (String)test2.get("ATime");
//				 String tAcode2 = (String)test2.get("Acode");
//				 String tAvia2 = (String)test2.get("Avia");
//				 String tbase2 = (String)test2.get("base");
//				 String ttotal2 = (String)test2.get("total");
//				 String tchul2 = (String)test2.get("chul");
//				 String tchak2 = (String)test2.get("chak");
//				 String tgyeongUCount2 = (String)test2.get("gyeongUCount");
//				 if(tDTime.equals(tDTime2)&&
//				 tDcode.equals(tDcode2)&&
//				 tDvia.equals(tDvia2)&&
//				 tATime.equals(tATime2)&&
//				 tAcode.equals(tAcode2)&&
//				 tAvia.equals(tAvia2)&&
//				 tbase.equals(tbase2)&&
//				 ttotal.equals(ttotal2)&&
//				 tchul.equals(tchul2)&&
//				 tchak.equals(tchak2)&&
//				 tgyeongUCount.equals(tgyeongUCount2))
//				 	{
//						eqInSeg.put(l, false);
//				 	}
//				 
//			}
//		}
//		Set<Integer> keys = eqInSeg.keySet();
//		for(Integer key:keys) {
//			eqInSeg.remove(key);
//		}
		model.addAttribute("list", list);
		model.addAttribute("flightOffersSearches", flightOffersSearches[0].toString());

		return "air/AirList.tiles";
	}

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