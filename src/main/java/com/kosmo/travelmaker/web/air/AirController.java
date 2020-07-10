package com.kosmo.travelmaker.web.air;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

@Controller
@RequestMapping("/TravelMaker/")
public class AirController {
	//api키 properties에서 가져오기
	@Value("${SkyscannerAirportAutoCompleteApiKey}")
	private String AutoCompleteApiKey;
	@Value("${AmadeusFlightApiKey}")
	private String AmadeusFlightApiKey;
	@Value("${AmadeusFlightSecretApiKey}")
	private String AmadeusFlightSecretApiKey;
	// 아마데우스 API 사용을 위한 자바 구문
	@ResponseBody
	@RequestMapping(value="AirSearch.kosmo", produces = "text/html; charset=UTF-8")
	public String AirSearch(@RequestParam Map map, Model model) throws ResponseException {
		System.out.println("AirSearch들어옴");
		Amadeus amadeus = Amadeus.builder(AmadeusFlightApiKey, AmadeusFlightSecretApiKey).build();
		FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
				Params.with("originLocationCode", map.get("departure"))
				.and("destinationLocationCode", map.get("arrival"))
				.and("departureDate", map.get("departureDate"))
				.and("returnDate", map.get("returnDate"))
				.and("adults", Integer.parseInt((String)map.get("adult")))
				.and("currencyCode", "KRW")
				.and("max", 30)
				.and("children", map.get("children")==""?0:Integer.parseInt((String)map.get("children"))));
	  	//segment한개를 맵에담는다(출발지 - 경유지)
	  	//segments를 리스트에담는다 (출발지 - 경유지 - 도착지)
	  	//segments와 itinerary를 맵에 담는다 (출발:도착,도착:출발,티켓전체에 대한 정보)
	  	List<Map> dataList = new Vector<Map>();
	  	Map itineraryMap = new HashMap();
	  	List segmentsList = new Vector();
	  	Map cityIataCodeMap = new HashMap();
	  	String jungbok="";
	  	//data에 왕복티켓1매의 전체정보가 저장되어있음(data[max값],최대갯수는 아마데우스클래스의 인자max로 결정)
        for (int f=0;f<flightOffersSearches.length;f++) {
        	itineraryMap = new HashMap();
        	//중복체크
        	if(flightOffersSearches[f].getItineraries()[0].getDuration().equals(jungbok)) continue; 
        	else jungbok = flightOffersSearches[f].getItineraries()[0].getDuration();
	  		for (int k=0;k<flightOffersSearches[f].getItineraries().length;k++) {
	  			
  				//출발시간
  				String startTime = flightOffersSearches[f].getItineraries()[k].getSegments()[0].getDeparture().getAt();
  				//도착시간
  				String endTime = flightOffersSearches[f].getItineraries()[k].getSegments()[flightOffersSearches[f].getItineraries()[k].getSegments().length-1].getArrival().getAt();
	  			//경유 횟수는 segments갯수로 계산함
	  			int gyeongUCount = flightOffersSearches[f].getItineraries()[k].getSegments().length - 1;
	  			cityIataCodeMap = new HashMap();
	  			//출발-경유-도착까지의 도시이름, 도착-경유-출발까지의 도시이름을 맵에 전부저장 : key값은 0부터시작하는 i값
	  			for (int i=0;i < flightOffersSearches[f].getItineraries()[k].getSegments().length;i++) {
	  				//출발지,경유지들 iataCode 한번씩 저장
	  				cityIataCodeMap.put("code"+i,flightOffersSearches[f].getItineraries()[k].getSegments()[i].getDeparture().getIataCode());
	  				if(i==flightOffersSearches[f].getItineraries()[k].getSegments().length - 1)
	  					//마지막segment의 출발지를 입력할때 도착지까지입력
	  					//즉 첫번째 방에 출발지, 마지막 방에 도착지 중간방에 경유지들을 저장
	  					cityIataCodeMap.put("code"+(i+1),flightOffersSearches[f].getItineraries()[k].getSegments()[i].getArrival().getIataCode());
	  			}
	  			//출발에서 도착까지 필요한 정보들
	  			segmentsList = new Vector();
	  			segmentsList.add(startTime);
	  			segmentsList.add(endTime);
	  			segmentsList.add(gyeongUCount);
	  			segmentsList.add(cityIataCodeMap);
		  		itineraryMap.put("segmentsList"+k,segmentsList);
	  		}
	  		//왕복티켓하나에서 필요한 정보들
	  		//출발에서 도착까지 걸리는 시간
  			String originToDestTime = flightOffersSearches[f].getItineraries()[0].getDuration();
  			//도착에서 출발까지 걸리는 시간
			String DestToOriginTime = flightOffersSearches[f].getItineraries()[1].getDuration();
			itineraryMap.put("originToDestTime",originToDestTime);
	  		itineraryMap.put("DestToOriginTime",DestToOriginTime);
	  		itineraryMap.put("totalPrice",Double.toString(flightOffersSearches[f].getPrice().getTotal()));
	  		itineraryMap.put("basePrice",Double.toString(flightOffersSearches[f].getPrice().getBase()));
	        dataList.add(itineraryMap);
	  	}
        System.out.println(dataList);
        JSONArray ja = new JSONArray();
        for(int g=0;g<dataList.size();g++) {
        	//System.out.println(dataList.get(g));
			ja.add(dataList.get(g));	
		}
        return ja.toJSONString();
	}
	
	@RequestMapping("AirList.kosmo")
	public String AirList(Model model) {
		model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
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