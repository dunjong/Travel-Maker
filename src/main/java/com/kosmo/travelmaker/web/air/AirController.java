package com.kosmo.travelmaker.web.air;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Select;
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
import com.kosmo.travelmaker.service.AirDTO;
import com.kosmo.travelmaker.service.HotelDTO;
import com.kosmo.travelmaker.service.impl.AirServiceImpl;
import com.kosmo.travelmaker.service.impl.HotelServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;

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
	//
	@Resource(name="airService")
	private AirServiceImpl airService;
	
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	
	
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
			//출발시간
			String startTime = flightOffersSearches[f].getItineraries()[0].getSegments()[0].getDeparture().getAt();
			//도착시간
			String endTime = flightOffersSearches[f].getItineraries()[0].getSegments()[flightOffersSearches[f].getItineraries()[0].getSegments().length-1].getArrival().getAt();
  			//경유 횟수는 segments갯수로 계산함
  			int gyeongUCount = flightOffersSearches[f].getItineraries()[0].getSegments().length - 1;
  			cityIataCodeMap = new HashMap();
  			//출발-경유-도착까지의 도시이름, 도착-경유-출발까지의 도시이름을 맵에 전부저장 : key값은 0부터시작하는 i값
  			for (int i=0;i < flightOffersSearches[f].getItineraries()[0].getSegments().length;i++) {
  				//출발지,경유지들 iataCode 한번씩 저장
  				cityIataCodeMap.put("code"+i,flightOffersSearches[f].getItineraries()[0].getSegments()[i].getDeparture().getIataCode());
  				if(i==flightOffersSearches[f].getItineraries()[0].getSegments().length - 1)
  					//마지막segment의 출발지를 입력할때 도착지까지입력
  					//즉 첫번째 방에 출발지, 마지막 방에 도착지 중간방에 경유지들을 저장
  					cityIataCodeMap.put("code"+(i+1),flightOffersSearches[f].getItineraries()[0].getSegments()[i].getArrival().getIataCode());
  			}
  			//출발에서 도착까지 필요한 정보들
  			segmentsList = new Vector();
  			segmentsList.add(startTime);
  			segmentsList.add(endTime);
  			segmentsList.add(gyeongUCount);
  			segmentsList.add(cityIataCodeMap);
	  		itineraryMap.put("segmentsList0",segmentsList);
	  		
	  		//왕복티켓하나에서 필요한 정보들
	  		//출발에서 도착까지 걸리는 시간
  			String originToDestTime = flightOffersSearches[f].getItineraries()[0].getDuration();
			itineraryMap.put("originToDestTime",originToDestTime);
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
	@RequestMapping(value ="AirTest.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String AirTest(@RequestParam Map map,HttpSession session) {
		String user_id = (String)session.getAttribute("id");
		String departure = (String)map.get("departure");
		String arrival = (String)map.get("arrival");
		String ddate = (String)map.get("ddate");
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		int passenger = Integer.parseInt((String)map.get("passenger"));
		String price = (String)map.get("price");
		String adate = (String)map.get("adate");
		String time = (String)map.get("time");
		String via = (String)map.get("via");
		String Seatclass = (String)map.get("class");
		String result = "failure";
		AirDTO dto = new AirDTO();
		dto.setAir_adate(adate);
		dto.setAir_time(time);
		dto.setAir_via(via);
		dto.setAir_class(Seatclass);
		dto.setAir_arr(arrival);
		dto.setAir_class("언젠간 넣겠지");
		dto.setAir_ddate(ddate);
		dto.setAir_dep(departure);		
		dto.setAir_passenger(passenger);
		dto.setAir_price(price);
		dto.setPlanner_no(planner_no);
		if(airService.insertAirDtoToRes(dto)) {
			
			int air_no=airService.selectAirNo();
			Map<String,String> maps=new HashMap<String,String>();
			maps.put("user_id", session.getAttribute("id").toString());
			maps.put("h_a_no", "a_"+air_no);
			plannerService.insertRes(maps);
			
			result = user_id+"님! "+departure+"에서 "+arrival+"로 "+ddate+" 일에 성인"+passenger+"명 의 항공권이 등록되었습니다. 가격은 "+price+"원 입니다";
			
		};
		
		// 플래너에 항공권연결시 같은 플래너인지 확인하는 코드용 자리
//		if(airService.CompareTimePlace(ddate,departure,arrival)>0) {}
//		else {}
		return result;
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