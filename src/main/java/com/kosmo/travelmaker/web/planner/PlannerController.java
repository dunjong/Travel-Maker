package com.kosmo.travelmaker.web.planner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.request.collection.KeySet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kosmo.travelmaker.service.AirDTO;
import com.kosmo.travelmaker.service.AirService;
import com.kosmo.travelmaker.service.CitiesDTO;
import com.kosmo.travelmaker.service.CityDTO;
import com.kosmo.travelmaker.service.CityService;
import com.kosmo.travelmaker.service.CountDTO;
import com.kosmo.travelmaker.service.HotelDTO;
import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.impl.AirServiceImpl;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.HotelServiceImpl;
import com.kosmo.travelmaker.service.impl.MemberServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {
	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;
	@Value("${SkyscannerAirportAutoCompleteApiKey}")
	private String AutoCompleteApiKey;
	@Value("${TripAdviserHotelApiKey}")
	private String TripAdviserHotelApiKey;
	//주입
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	@Resource (name="cityService")
	private CityServiceImpl cityService;
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	@Resource(name="hotelService")
	private HotelServiceImpl hotelService;
	@Resource(name="airService")
	private AirServiceImpl airService;
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	@RequestMapping(value="PlannerNoCreate.kosmo")
	@ResponseBody
	public String PlannerNoCreate(@RequestParam Map map,HttpSession session) {
		String planner_name="NoName";
		String cities_date="";
		String[] city_no_list=map.get("city_no").toString().split(",");
		int planner_no=0;
		if(plannerService.insertPlanner(session.getAttribute("id").toString())) {
			System.out.println("플래너가 저장되었습니다.");
			planner_no=plannerService.selectPlannerNo();
			for(String no:city_no_list) {
				Map<String, String> maps=new HashMap<String, String>();
				maps.put("planner_no", Integer.toString(planner_no));
				maps.put("city_no", no);
				maps.put("cities_date", cities_date);
				if(plannerService.insertCities(maps)) {
					System.out.println(no+" 도시가 저장되었습니다.");
					int cities_no=plannerService.selectCitiesNo();
					String city_name=cityService.selectCityDTO(Integer.parseInt(no)).getCity_name();
				}///if
			}///for
		};///if
		return Integer.toString(planner_no);
	}
	
	@RequestMapping(value = "Planner.kosmo")
	public String Planner(@RequestParam Map map,Model model,HttpSession session) {
		int planner_no=0;
		String planner_name="NoName";
		String cities_date="";
		System.out.println("map.get(\"planner_no\"):"+map.get("planner_no"));
		Map<String,Integer> city_no_name=new HashMap<String, Integer>();
		Map<String, String> city_name_date=new HashMap<String, String>();
		Map<String, String> city_hotel=new HashMap<String, String>();
		Map<String,String> city_hotel_name=new HashMap<String,String>();
		Map<String, String> city_plan_no=new HashMap<String,String>();
		
			planner_no=Integer.parseInt(map.get("planner_no").toString());
			Map<String, Integer> maps=new HashMap<String, Integer>();
			maps.put("planner_no", planner_no);
			List<PlannerDTO> planner_dto_list=plannerService.selectPlannerDTOByNo(planner_no);
			planner_name=planner_dto_list.get(0).getPlanner_name();
			for(int city_no:plannerService.selectPlannerList(Integer.parseInt(map.get("planner_no").toString()))) {
				System.out.println("planner_no:"+planner_no+"city_no:"+city_no);
				CityDTO cityDTO= cityService.selectCityDTO(city_no);
				maps.put("city_no", city_no);
				int cities_no=plannerService.selectCitiesNoByMap(maps);
				List<Integer> plan_nos= plannerService.selectPlanNoByCitiesNo(cities_no);
				if(plan_nos.size()!=0) {
					city_plan_no.put(cityDTO.getCity_name(), "1");
				}
				List<HotelDTO> hotel_dto=hotelService.selectHotelDTOByCitiesNo(cities_no);
				if(hotel_dto.size()!=0) {
					city_hotel.put(cityDTO.getCity_name(),"1");
					city_hotel_name.put(cityDTO.getCity_name(),hotel_dto.get(0).getHotel_name());
					
				}
				city_no_name.put(cityDTO.getCity_name(),cities_no);
				city_name_date.put(cityDTO.getCity_name(),cityService.selectCitiesDate(cities_no));
			}
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
		String today=transFormat.format(new Date());
		model.addAttribute("city_plan_no",city_plan_no);
		model.addAttribute("city_hotel_name",city_hotel_name);
		model.addAttribute("planner_name",planner_name);
		model.addAttribute("today",today);
		model.addAttribute("planner_no",planner_no);
		model.addAttribute("city_no_name",city_no_name);
		model.addAttribute("city_name_date",city_name_date);
		model.addAttribute("city_hotel",city_hotel);
		//String user_id=session.getAttribute("id").toString();
		//cityService.makingplanner(user_id);
		model.addAttribute("TripAdviserHotelApiKey",TripAdviserHotelApiKey);
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
		return "planner/Planner";
	}
	@RequestMapping("PlannerSave.kosmo")
	public String PlannerSave(@RequestParam Map map) {
		System.out.println(map.get("planner_name").toString()+":"+map.get("planner_no").toString());
		if(plannerService.updatePlannerName(map)) {
			System.out.println("planner 저장 완료!");
		}
		return "forward:/";
	}
	@RequestMapping(value ="SaveDates.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SaveDates(@RequestParam Map map) {
		String city_name=map.get("city_name").toString();
		String city_no=Integer.toString(cityService.selectCityNo(city_name));
		map.put("city_no", city_no);
		String cities_date=map.get("cities_date").toString();
		String flag=city_name+"의 "+cities_date+"저장실패";
		if(cityService.updateCitiesDate(map)) {
			flag=city_name+"의 "+cities_date+"저장성공";
		};
		return flag;
	}
	@RequestMapping(value ="SelectPlanDetails.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SelectPlanDetails(@RequestParam String cities_no){
		List<Integer> plan_nos= plannerService.selectPlanNoByCitiesNo(Integer.parseInt(cities_no));
		Map<String, String> maps=new HashMap<String, String>();
		for(int plan_no:plan_nos) {
			String plan_date=spotsService.selectPlanDateByNo(plan_no);
			List<SpotsDTO> spot_dto_list= spotsService.selectSpotDTOList(plan_no);
			String spot_names="";
			for(SpotsDTO spot_dto:spot_dto_list) {
				spot_names+=","+spot_dto.getSpot_name();
			}
			spot_names=spot_names.substring(1);
			maps.put(plan_date, spot_names);
		}
		List<Map> collections = new Vector<Map>();
		collections.add(maps);
		return JSONArray.toJSONString(collections);
	}
	@RequestMapping("Plan.kosmo")
	public String Plan(@RequestParam Map map, Model model) throws ParseException {
		String cities_no=map.get("cities_no").toString();
		String city_name=map.get("origin").toString();
		String calendarDate=cityService.selectCitiesDate(Integer.parseInt(cities_no));
		int gap=5;
		Map<String, String> maps=new HashMap<String, String>();
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-mm-dd");
		//호텔
		List<HotelDTO> hotel_dto_list=hotelService.selectHotelDTOByCitiesNo(Integer.parseInt(cities_no));
		if(hotel_dto_list.size()!=0) {
			HotelDTO hotel_dto =hotel_dto_list.get(0);
			Date checkIn=transFormat.parse(hotel_dto.getHotel_in());
			Date checkOut=transFormat.parse(hotel_dto.getHotel_out());
			gap=(int)((checkOut.getTime()-checkIn.getTime())/(1000*60*60*24)+1);
			maps.put("hotel_name", hotel_dto.getHotel_name());
			maps.put("hotel_latlng",hotel_dto.getHotel_latlng());
			maps.put("hotel_date",Integer.toString(gap));
			maps.put("hotel_price",hotel_dto.getHotel_price());;
		}
		else {
			System.out.println("calendarDate:"+calendarDate);
			maps.put("hotel_latlng", city_name);
			maps.put("hotel_name", city_name);
			maps.put("hotel_price", "없음");
			if(calendarDate!=null) {
				Date checkIn=transFormat.parse(calendarDate.split(",")[0]);
				Date checkOut=transFormat.parse(calendarDate.split(",")[1]);
				gap=(int)((checkOut.getTime()-checkIn.getTime())/(1000*60*60*24)+1);
				maps.put("hotel_date",Integer.toString(gap));
			}
			else {
				maps.put("hotel_date", "없음");
				
			}
		}
		//호텔
		int city_no=cityService.selectCityNo(city_name);
		Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
		for(int i=1;i<=gap;i++) {
			List<String> spotIDs=new Vector<String>();
			dayPlan.put("day"+i, spotIDs);
		}
		model.addAttribute("gap",gap);
		model.addAttribute("hotel", maps);
		model.addAttribute("planner_no",map.get("planner_no"));
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("dayPlan",dayPlan);
		model.addAttribute("origin",city_name);
		model.addAttribute("city_no",city_no);
		model.addAttribute("cities_no",cities_no);
		return "planner/Plan.tiles";
	}
	@RequestMapping(value ="SavedPlan.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SavedPlan(@RequestParam Map map) throws ParseException {
		String cities_no=map.get("cities_no").toString();
		int gap=5;
		List<Integer> plan_no_list=plannerService.selectPlanNoByCitiesNo(Integer.parseInt(cities_no));
		List<HotelDTO> hotel_dto_list=hotelService.selectHotelDTOByCitiesNo(Integer.parseInt(cities_no));
		String calendarDate=cityService.selectCitiesDate(Integer.parseInt(cities_no));
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-mm-dd");
		if(hotel_dto_list.size()!=0) {
			HotelDTO hotel_dto =hotel_dto_list.get(0);
			Date checkIn=transFormat.parse(hotel_dto.getHotel_in());
			Date checkOut=transFormat.parse(hotel_dto.getHotel_out());
			gap=(int)((checkOut.getTime()-checkIn.getTime())/(1000*60*60*24)+1);
			//;
		}
		else if(calendarDate!=null) {
			Date checkIn=transFormat.parse(calendarDate.split(",")[0]);
			Date checkOut=transFormat.parse(calendarDate.split(",")[1]);
			gap=(int)((checkOut.getTime()-checkIn.getTime())/(1000*60*60*24)+1);
		}
		List<SpotsDTO> list=spotsService.spotListByCitiesNo(Integer.parseInt(cities_no));
		Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
		System.out.println("saved:"+gap);
		for(int i=1;i<=gap;i++) {
			List<String> spotIDs=new Vector<String>();
			dayPlan.put("day"+i, spotIDs);
		}
		for(SpotsDTO dto:list) {
			System.out.println("장소명:"+dto.getSpot_name()+",일차:"+dto.getPlan_date()+",id:"+dto.getSpot_id());
			String day=dto.getPlan_date();
			if(Integer.parseInt(day)<=gap) {
				switch(day) {
					case "1":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "2":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "3":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "4":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "5":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "6":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "7":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "8":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					case "9":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
						break;
					default:
						dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
				}
			}
		}
		List<Map> collections = new Vector<Map>();
		collections.add(dayPlan);
		return JSONArray.toJSONString(collections);
	}
	@RequestMapping(value ="PlanSave.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public void PlanSave(@RequestParam Map<String,String> map) {
		System.out.println("map: "+map);
		int planner_no=Integer.parseInt(map.get("planner_no"));
		String city_name=map.get("city_name");
		int city_no=cityService.selectCityNo(city_name);
		int cities_no=Integer.parseInt(map.get("cities_no"));
		List<Integer> plan_no_list=plannerService.selectPlanNoByCitiesNo(cities_no);
		for(int plan_no:plan_no_list ){
			if(spotsService.deleteSpotByPlanNo(plan_no)) {
				System.out.println("spot들 삭제 완료");
			};
		}
		if(plannerService.deletePlanByCitiesNo(cities_no)){
			System.out.println("plan들 삭제 완료");
		};
		for(String date:map.keySet()) {
			String ids="";
			Map<String, Object> maps2=new HashMap<String, Object>();
			if(date.contains("day")&&map.get(date).length()>0) {
				maps2.put("plan_date", date.substring(3));
				maps2.put("cities_no", cities_no);
				if(plannerService.insertPlan(maps2)) {
					System.out.println(date+"일차 plan이 저장되었습니다");
					int plan_no=plannerService.selectPlanNo();
					SpotsDTO dto=new SpotsDTO();
					dto.setPlan_no(plan_no);
					ids=map.get(date).substring(0,map.get(date).length()-1);
					System.out.println(date+"일차 아이디들: "+ids);
					for(String id:ids.substring(0,ids.length()).split("&")) {
						if(id.split(":").length==3) {
							dto.setSpot_id(id.split(":")[0]);
							dto.setLatlng(id.split(":")[1]);
							dto.setSpot_name(id.split(":")[2]);
							if(spotsService.insertSaveSpot(dto)) {
								System.out.println(date+"일차 plan이"+id+"가 저장되었습니다");
							}///if
						}
						else {
							System.out.println("스팟 저장 안됨");
						}
						
					}///for
				}///if
			}///if
				//spotsService.insertPlan(date);
		}///for
		List<String> list=new Vector<String>();
		//dto.setCity_no(Integer.parseInt(map.get("city_no").toString()));
	}
	@RequestMapping("CitySearch.kosmo")
	public String CitySearch() {
		return "planner/CitySearch.main";
	}
	@RequestMapping("DayPlanSava.kosmo")
	public String DayPlanSava() {
		return "planner/Plan.tiles";
	}
	@RequestMapping(value ="SpotList.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SpotList(@RequestParam Map map) {
			System.out.println("city_no:"+map.get("city_no"));
			System.out.println("cities_no:"+map.get("cities_no"));
			System.out.println("gap:"+map.get("gap"));
			int gap=Integer.parseInt(map.get("gap").toString());
			List<SpotsDTO> list=spotsService.spotList(map);
			Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
			for(int i=1;i<=gap;i++) {
				List<String> spotIDs=new Vector<String>();
				dayPlan.put("day"+i, spotIDs);
			}
			for(SpotsDTO dto:list) {
				System.out.println("장소명:"+dto.getSpot_name()+",일차:"+dto.getAuto_plan_date());
				String day=dto.getAuto_plan_date();
				if(Integer.parseInt(day)<=gap) {
					switch(day) {
						case "1":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "2":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "3":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "4":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "5":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "6":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "7":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "8":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						case "9":
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
							break;
						default:
							dayPlan.get("day"+day).add(dto.getSpot_id().toString().trim());
					}
				}
			}
			List<Map> collections = new Vector<Map>();
			collections.add(dayPlan);
			return JSONArray.toJSONString(collections);
		}
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	@RequestMapping(value="CallCityList.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String CallCityList() {
		List<Map> collections = new Vector<Map>();
		List<CountDTO> count_list = cityService.selectCityCount();
		for(CountDTO count_dto:count_list) {
			int city_count=count_dto.getCount();
			int city_no=count_dto.getCity_no();
			Map<String, String> maps_cities=new HashMap<String, String>();
			CityDTO dto_city= cityService.selectCityDTO(city_no);
			maps_cities.put("img", dto_city.getCity_img());
			maps_cities.put("name", dto_city.getCity_name());
			maps_cities.put("intro", dto_city.getCity_intro());
			maps_cities.put("city_no",Integer.toString(city_no));
			maps_cities.put("city_count", Integer.toString(city_count));
			collections.add(maps_cities);
		}
		return JSONArray.toJSONString(collections);
	}
	@RequestMapping(value="CallPlannerList.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String CallPlannerList(@RequestParam Map map,HttpSession sessionSccope) throws ParseException {
		List<Map> collections = new Vector<Map>();
		if(sessionSccope.getAttribute("id")!=null) {
			String user_id=sessionSccope.getAttribute("id").toString();
			SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
			Date today=new Date();
			int gap=0;
			String city_no=map.get("city_no").toString();
			List<Integer> cities_no_list=cityService.selectCitiesNoListBycityNo(Integer.parseInt(city_no));
			for(int cities_no:cities_no_list) {
			String cities_date= cityService.selectCitiesDate(cities_no);
					Map<String,String> maps=new HashMap<String,String>();
					boolean flag=true;
					PlannerDTO planner_dto=plannerService.selectPlannerDTOBycitiesNo(cities_no);
					int planner_no=planner_dto.getPlanner_no();
					System.out.println();
					if(planner_dto.getUser_id().equals(user_id)) {
						flag=false;
					}
					List <CitiesDTO> cities_dto_list=cityService.selectCitiesDTO(planner_no);
					for(CitiesDTO cities_dto:cities_dto_list) {
						if(cities_dto.getCities_date()!=null) {
							Date cities_start_date=transFormat.parse(cities_dto.getCities_date().split(",")[0]);
							if(today.compareTo(cities_start_date)>=0) {
								flag=false;
								}
							else {
								gap=(int)((cities_start_date.getTime()-today.getTime())/(1000*60*60*24)+1);
							}
						}
					}
					if(flag) {
						maps.put("gap", Integer.toString(gap));
						maps.put("city_no", city_no);
						maps.put("acc", Integer.toString(planner_dto.getPlanner_acc()));
						maps.put("name", planner_dto.getPlanner_name());
						maps.put("id", planner_dto.getUser_id());
						maps.put("no", Integer.toString(planner_dto.getPlanner_no()));
						collections.add(maps);
					}
			}
		}
		else{
			Map<String,String> maps=new HashMap<String,String>();
			maps.put("login", "동행서비스는 로그인 후 이용하세요");
			collections.add(maps);
		}
		return JSONArray.toJSONString(collections);
	}
	@RequestMapping("PlannerView.kosmo")
	public String PlannerView(@RequestParam Map map, Model model) {
		int planner_no=0;
		String planner_name="NoName";
		String cities_date="";
		String city_no_from_home=map.get("city_no").toString();
		Map<String,Integer> city_no_name=new HashMap<String, Integer>();
		Map<String, String> city_name_date=new HashMap<String, String>();
		Map<String, String> city_hotel=new HashMap<String, String>();
		Map<String,String> city_hotel_name=new HashMap<String,String>();
		Map<String, String> city_plan_no=new HashMap<String,String>();
		planner_no=Integer.parseInt(map.get("planner_no").toString());
		Map<String, Integer> maps=new HashMap<String, Integer>();
		maps.put("planner_no", planner_no);
		List<PlannerDTO> planner_dto_list=plannerService.selectPlannerDTOByNo(planner_no);
		planner_name=planner_dto_list.get(0).getPlanner_name();
		for(int city_no:plannerService.selectPlannerList(Integer.parseInt(map.get("planner_no").toString()))) {
			CityDTO cityDTO= cityService.selectCityDTO(city_no);
			maps.put("city_no", city_no);
			int cities_no=plannerService.selectCitiesNoByMap(maps);
			List<Integer> plan_nos= plannerService.selectPlanNoByCitiesNo(cities_no);
			if(plan_nos.size()!=0) {
				city_plan_no.put(cityDTO.getCity_name(), "1");
			}
			List<HotelDTO> hotel_dto=hotelService.selectHotelDTOByCitiesNo(cities_no);
			if(hotel_dto.size()!=0) {
				city_hotel.put(cityDTO.getCity_name(),"1");
				city_hotel_name.put(cityDTO.getCity_name(),hotel_dto.get(0).getHotel_name());
			}
			city_no_name.put(cityDTO.getCity_name(),cities_no);
			city_name_date.put(cityDTO.getCity_name(),cityService.selectCitiesDate(cities_no));
		}
		SimpleDateFormat transFormat=new SimpleDateFormat("yyyy-MM-dd");
		String today=transFormat.format(new Date());
		model.addAttribute("city_no",city_no_from_home);
		model.addAttribute("city_plan_no",city_plan_no);
		model.addAttribute("city_hotel_name",city_hotel_name);
		model.addAttribute("planner_name",planner_name);
		model.addAttribute("today",today);
		model.addAttribute("planner_no",planner_no);
		model.addAttribute("city_no_name",city_no_name);
		model.addAttribute("city_name_date",city_name_date);
		model.addAttribute("city_hotel",city_hotel);
		//String user_id=session.getAttribute("id").toString();
		//cityService.makingplanner(user_id);
		model.addAttribute("TripAdviserHotelApiKey",TripAdviserHotelApiKey);
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("AutoCompleteApiKey",AutoCompleteApiKey);
		
		return "planner/PlannerView";
		
	}
	
	@RequestMapping(value="CallPlanDetilsByMap.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String CallPlanDetilsByMap(@RequestParam Map map) {
		System.out.println("cities_no:"+map.get("cities_no")+",planner_no:"+map.get("planner_no").toString()+",day:"+map.get("day"));
		
		List<Map> collections = new Vector<Map>();
		int cities_no=Integer.parseInt(map.get("cities_no").toString());
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		int plan_date=Integer.parseInt(map.get("day").toString());
		int city_no=cityService.selectCityNoByCitiesNo(cities_no);
		CityDTO city_dto= cityService.selectCityDTO(city_no);
		String city_name=city_dto.getCity_name();
		List<HotelDTO> hotel_dto=hotelService.selectHotelDTOByCitiesNo(cities_no);
		Map<String,Integer> maps=new HashMap<String,Integer>();
		maps.put("cities_no", cities_no);
		maps.put("plan_date",plan_date);
		List<Integer> plan_no_list=spotsService.selectPlanNoListByDayNCity(maps);
			int plan_no=plan_no_list.get(0);
			System.out.println("plan_no:"+plan_no);
			List<SpotsDTO> spot_dto_list= spotsService.selectSpotDTOList(plan_no);
			for(SpotsDTO spot_dto:spot_dto_list) {
				Map<String,String> map_spot=new HashMap<String,String>();
				if(hotel_dto.size()==0) {
				map_spot.put("origin", city_name);
				}
				else {
				map_spot.put("origin", hotel_dto.get(0).getHotel_latlng());
				}
				map_spot.put("day",Integer.toString(plan_date));
				map_spot.put("city_name", city_name);
				map_spot.put("latlng", spot_dto.getLatlng());
				map_spot.put("name", spot_dto.getSpot_name());
				map_spot.put("id", spot_dto.getSpot_id());
				collections.add(map_spot);
			}
			
		
		
		return JSONArray.toJSONString(collections);
	}
	@RequestMapping(value="PlannerAcc.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String PlannerAcc(@RequestParam Map map,HttpSession session) {
		String planner_no=map.get("planner_no").toString();
		String user_id=session.getAttribute("id").toString();
		Map<String,String> maps=new HashMap<String,String>();
		maps.put("planner_no", planner_no);
		maps.put("user_id", user_id);
		if(!"0".equals(memberService.selectMemberDTO(user_id).getId_no())) {
			if(plannerService.insertAcc(maps)) {
			}
			int planner_acc=plannerService.selectAccNoByPlannerNo(Integer.parseInt(planner_no));
			maps.put("planner_acc", Integer.toString(planner_acc));
			if(plannerService.updateAccNo(maps)) {
				System.out.println("동행자 수 변경");
			}
		}
		else {
			planner_no="fail";
		}
		return planner_no;
	}
	
	@RequestMapping(value="PlannerAccCancel.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String PlannerAccCancel(@RequestParam Map map,HttpSession session) {
		String planner_no=map.get("planner_no").toString();
		System.out.println("planner_no:"+planner_no);
		String user_id=session.getAttribute("id").toString();
		Map<String,String> maps=new HashMap<String,String>();
		maps.put("planner_no", planner_no);
		maps.put("user_id", user_id);
		if(plannerService.DeleteAcc(maps)) {
			System.out.println(user_id+"의 "+planner_no+" 동행 삭제" );
		}
		int planner_acc=plannerService.selectAccNoByPlannerNo(Integer.parseInt(planner_no));
		maps.put("planner_acc", Integer.toString(planner_acc));
		if(plannerService.updateAccNo(maps)) {
			System.out.println("동행자 수 변경");
		}
		return planner_no;
	}
	
	@RequestMapping(value="SavePlannerName.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public void SavePlannerName(@RequestParam Map map){
		plannerService.updatePlannerName(map);
	}
	
	@RequestMapping(value="PayFees.kosmo", produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String PayFees(@RequestParam Map map,HttpSession session){
		int planner_no=Integer.parseInt(map.get("planner_no").toString());
		String user_id=session.getAttribute("id").toString();
		List<Map> collections = new Vector<Map>();
		
		List<AirDTO> air_dto_list=airService.selectAirDTOByplannerNo(planner_no);
		for(AirDTO air_dto:air_dto_list) {
			Map<String, String> a_map=new HashMap<String,String>();
			a_map.put("air_ddate", air_dto.getAir_ddate());
			//collections.add(e)
		}
		List<CitiesDTO> cities_dto_list= cityService.selectCitiesDTO(planner_no);
		for(CitiesDTO cities_dto:cities_dto_list) {
			List<HotelDTO> hotel_dto_list= hotelService.selectHotelDTOByCitiesNo(cities_dto.getCities_no());
			for(HotelDTO hotel_dto:hotel_dto_list) {
				
			}
			
		}
		//hotelService.selectHotelDTOByCitiesNo(cities_no);
		
		
		return JSONArray.toJSONString(collections);
	}
	
}






















