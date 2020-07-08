package com.kosmo.travelmaker.web.air;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.springframework.beans.factory.annotation.Value;
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
	//api키 properties에서 가져오기
	@Value("${SkyscannerAirportAutoCompleteApiKey}")
	private String AutoCompleteApiKey;
	@Value("${AmadeusFlightApiKey}")
	private String AmadeusFlightApiKey;
	@Value("${AmadeusFlightSecretApiKey}")
	private String AmadeusFlightSecretApiKey;
	// 아마데우스 API 사용을 위한 자바 구문
	@RequestMapping("AirSearch.kosmo")
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
        for (FlightOfferSearch data : flightOffersSearches) {
        	//중복체크
    		if(data.getItineraries()[0].getDuration().equals(jungbok)) continue;
    		else jungbok = data.getItineraries()[0].getDuration();
	  		for (int k=0;k<data.getItineraries().length;k++) {
	  			//출발에서 도착까지 걸리는 시간
	  			String originToDestTime = data.getItineraries()[k].getDuration();
	  			//도착에서 출발까지 걸리는 시간
  				String DestToOriginTime = data.getItineraries()[k].getDuration();
  				//출발시간
  				String startTime = data.getItineraries()[k].getSegments()[0].getDeparture().getAt();
  				//도착시간
  				String endTime = data.getItineraries()[k].getSegments()[data.getItineraries()[k].getSegments().length-1].getArrival().getAt();
	  			//경유 횟수는 segments갯수로 계산함
	  			int gyeongUCount = data.getItineraries()[k].getSegments().length - 1;
	  			cityIataCodeMap = new HashMap();
	  			//출발-경유-도착까지의 도시이름, 도착-경유-출발까지의 도시이름을 맵에 전부저장 : key값은 0부터시작하는 i값
	  			for (int i=0;i < data.getItineraries()[k].getSegments().length;i++) {
	  				//출발지,경유지들 iataCode 한번씩 저장
	  				cityIataCodeMap.put(i,data.getItineraries()[k].getSegments()[i].getDeparture().getIataCode());

	  				if(i==data.getItineraries()[k].getSegments().length - 1)

	  					//마지막segment의 출발지를 입력할때 도착지까지입력
	  					//즉 첫번째 방에 출발지, 마지막 방에 도착지 중간방에 경유지들을 저장
	  					cityIataCodeMap.put(i+1,data.getItineraries()[k].getSegments()[i].getArrival().getIataCode());
	  			}
	  			System.out.println("출발에서도착까지---------------");
	  			System.out.println("출발시간"+startTime);
	  			System.out.println("출발IATACODE"+cityIataCodeMap);
	  			System.out.println("총경유시간"+originToDestTime);
	  			System.out.println("경유or직항횟수"+gyeongUCount);
	  			System.out.println("경유IATACODE"+cityIataCodeMap);  			
	  			System.out.println("도착시간"+endTime);
	  			System.out.println("도착IATACODE"+cityIataCodeMap);
	  			System.out.println("기본가"+data.getTravelerPricings()[0].getPrice().getBase());
	  			System.out.println("총가격"+data.getTravelerPricings()[0].getPrice().getTotal());
	  			
	  			System.out.println("도착에서출발로 돌아가기----------------");
	  			System.out.println("출발시간"+startTime);
	  			System.out.println("출발IATACODE"+cityIataCodeMap);
	  			System.out.println("총경유시간"+DestToOriginTime);
	  			System.out.println("경유or직항횟수"+gyeongUCount);
	  			System.out.println("경유IATACODE"+cityIataCodeMap);  			
	  			System.out.println("도착시간"+endTime);
	  			System.out.println("도착IATACODE"+cityIataCodeMap);
	  			System.out.println("기본가"+data.getTravelerPricings()[0].getPrice().getBase());
	  			System.out.println("총가격"+data.getTravelerPricings()[0].getPrice().getTotal());
	  			
	  			//출발에서 도착까지 필요한 정보들
	  			segmentsList = new Vector();
	  			segmentsList.add(originToDestTime);
	  			segmentsList.add(DestToOriginTime);
	  			segmentsList.add(startTime);
	  			segmentsList.add(endTime);
	  			segmentsList.add(gyeongUCount);
	  			segmentsList.add(cityIataCodeMap);
		  		itineraryMap.put("segmentsList"+k,segmentsList);
	  		}
	  		//왕복티켓하나에서 필요한 정보들
	  		itineraryMap.put("totalPrice",Double.toString(data.getPrice().getTotal()));
	  		itineraryMap.put("basePrice",Double.toString(data.getPrice().getBase()));
	        dataList.add(itineraryMap);
	  	}
        model.addAttribute("list", dataList);
        model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
        if(map.get("from").toString().equals("planner")){
        	return "planner/Planner";
        }
        return "air/AirList.tiles";
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