package com.jeju.trip.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.jeju.trip.vo.TripVO;





public class TourApi {
		
	public List<TripVO> getTour(){
	// 인증키
	String serviceKey = "z0BtewzDyr%2BEJ7y49vx0hLRZyvSgaOFN5rkkFLNVD8wC%2BLQpc8Lp3Ngv%2FZ69flDgbQ3E3dogJsiOEwItxCMqUA%3D%3D";

	// 파싱한 데이터를 저장할 변수
	String result = "";
	List<TripVO> lt = new ArrayList<TripVO>();

	try {																										/*관광정보조회 : areaBasedList*/
		StringBuilder urlBuilder = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey="+serviceKey); /*URL*/
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과수*/
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
		urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
		urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
		urlBuilder.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*지역코드, 시군구코드*/
		urlBuilder.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*관광지:12, 문화시설:14, 축제/공연/행사:15, 레포츠:28, 숙박:32, 쇼핑:38, 음식:39*/
		urlBuilder.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*정렬 : A=제목순, B=조회순, C=수정일순, D=생성일순)*/
		urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*json 형식으로 받기*/
		
		System.out.println("주소 : "+urlBuilder.toString());
		
		URL url = new URL(urlBuilder.toString());

		BufferedReader bf;

		bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

		result = bf.readLine();
		
		System.out.println("json : "+result);		// 가져온 json 출력

    	JSONParser jsonParser = new JSONParser();
    	JSONObject obj = (JSONObject)jsonParser.parse(result);
    	
    	JSONObject parse_response = (JSONObject) obj.get("response");
    	
    	// response 로 부터 body 찾아오기 
    	JSONObject parse_body = (JSONObject) parse_response.get("body");
    	
    	// body 로 부터 items 받아오기
    	JSONObject parse_items = (JSONObject) parse_body.get("items");
    	
    	// items로 부터 itemlist 를 받아옵니다.
    	JSONArray parse_itemlist = (JSONArray) parse_items.get("item");

    	// 새로운 url 만들기위해
    	StringBuilder urlBuilder2 = null;
    	URL url2 = null;
    	String result2 = "";
    	BufferedReader bf2;
    	
    	// 각각 요소 출력
    	for (int i = 0; i < parse_itemlist.size(); i++) { // 해당 JSONArray객체에 값을 차례대로 가져와서 읽습니다.
    		JSONObject temp = (JSONObject) parse_itemlist.get(i);	//Array에서 i번째 객체 하나씩 꺼내기
    		TripVO vo = new TripVO();
    		System.out.println(temp.get("title").getClass());	// 해당 데이터의 자료형 알아내기
    		
    		String title = (String) temp.get("title");
    		Long contentid = (Long) temp.get("contentid");
    		String firstimage=(String)temp.get("firstimage");
    		System.out.println("배열의 " + i + "번째 요소");
    		System.out.println("title : " + title);
    		System.out.println("contentid : " + contentid); 
    		System.out.println("firtsimage:" +firstimage);
    		
    		urlBuilder2 = new StringBuilder("http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey="+serviceKey); /*URL*/
    		urlBuilder2.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과수*/
    		urlBuilder2.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재 페이지 번호*/
    		urlBuilder2.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("ETC", "UTF-8")); /*IOS (아이폰), AND (안드로이드), WIN (원도우폰), ETC*/
    		urlBuilder2.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("AppTest", "UTF-8")); /*서비스명=어플명*/
    		urlBuilder2.append("&" + URLEncoder.encode("areaCode","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*지역코드, 시군구코드*/
    		urlBuilder2.append("&" + URLEncoder.encode("contentTypeId","UTF-8") + "=" + URLEncoder.encode("39", "UTF-8")); /*관광지:12, 문화시설:14, 축제/공연/행사:15, 레포츠:28, 숙박:32, 쇼핑:38, 음식:39*/
    		urlBuilder2.append("&" + URLEncoder.encode("arrange","UTF-8") + "=" + URLEncoder.encode("B", "UTF-8")); /*정렬 : A=제목순, B=조회순, C=수정일순, D=생성일순)*/
    		urlBuilder2.append("&" + URLEncoder.encode("contentId","UTF-8") + "=" + URLEncoder.encode(contentid.toString(), "UTF-8")); 
    		urlBuilder2.append("&" + URLEncoder.encode("defaultYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*기본정보여부*/
    		urlBuilder2.append("&" + URLEncoder.encode("addrinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*상세주소여부*/
    		urlBuilder2.append("&" + URLEncoder.encode("firstimageYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8"));
    		urlBuilder2.append("&" + URLEncoder.encode("mapinfoYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*지도정보여부*/
    		urlBuilder2.append("&" + URLEncoder.encode("overviewYN","UTF-8") + "=" + URLEncoder.encode("Y", "UTF-8")); /*상세내용여부*/
    		urlBuilder2.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*json 형식으로 받기*/
    		
    		url2 = new URL(urlBuilder2.toString());

    		bf2 = new BufferedReader(new InputStreamReader(url2.openStream(), "UTF-8"));

    		result2 = bf2.readLine();
    		
    		System.out.println("json : "+result2);		// 가져온 json 출력

        	JSONParser jsonParser2 = new JSONParser();
        	JSONObject obj2 = (JSONObject)jsonParser2.parse(result2);
        	
        	JSONObject parse_response2 = (JSONObject) obj2.get("response");
        	
        	// response 로 부터 body 찾아오기 
        	JSONObject parse_body2 = (JSONObject) parse_response2.get("body");
        	
        	// body 로 부터 items 받아오기
        	JSONObject parse_items2 = (JSONObject) parse_body2.get("items");
        	
        	// items로 부터 itemlist 를 받아옵니다.
        	JSONObject parse_item = (JSONObject) parse_items2.get("item");
        	
        		System.out.println(temp.get("title").getClass());	// 해당 데이터의 자료형 알아내기
        		
        		String title2 = (String) parse_item.get("title");
        		Long contentid2 = (Long) parse_item.get("contentid");
        		Long contenttypeid = (Long) parse_item.get("contenttypeid");
        		String addr1 = (String) parse_item.get("addr1");
        		String addr2="";
        		if(parse_item.get("addr2") != null) {
                       if(parse_item.get("addr2").getClass().isInstance(addr1)) {
                          addr2 = (String) parse_item.get("addr2");
                       } else {
                          addr2 = ((Long) parse_item.get("addr2")).toString();
                       }
                    }
        		String tel= (String)parse_item.get("tel");
    			//Double mapx=(Double)parse_item.get("mapx");
        		Double mapx=null;
                 if(parse_item.get("mapx")!=null){
                    if(parse_item.get("mapx").getClass().isInstance(addr1)){
                       mapx=Double.parseDouble((String) parse_item.get("mapx"));
                    }else{
                       mapx=(Double)parse_item.get("mapx");
                    }
                 }
                 
                 Double mapy=null;
                 if(parse_item.get("mapy")!=null){
                    if(parse_item.get("mapy").getClass().isInstance(addr1)){
                       mapy=Double.parseDouble((String) parse_item.get("mapy"));
                    }else{
                       mapy=(Double)parse_item.get("mapy");
                    }
                 }
    			//Long zipcode=(Long)parse_item.get("zipcode");
        		String zipcode="";
        		if(parse_item.get("zipcode") != null) {
                       if(parse_item.get("zipcode").getClass().isInstance(addr1)) {
                          zipcode = (String) parse_item.get("zipcode");
                       } else {
                          zipcode = ((Long) parse_item.get("zipcode")).toString();
                       }
                    }
        		
        		String overview = (String) parse_item.get("overview");
        		
        		System.out.println("title : " + title2);
        		System.out.println("contentid : " + contentid2); 
        		System.out.println("contenttypeid:" +contenttypeid);
        		System.out.println("addr1 : "+addr1);
        		System.out.println("addr2 : "+addr2);
        		System.out.println("tel : " +tel);
        		System.out.println("overview : "+overview);
        		System.out.println("firstimage:" + firstimage);
        		System.out.println("mapx:" +mapx);
    			System.out.println("mapy:" +mapy);
    			System.out.println("zipcode :" + zipcode);
    			
    			
    			if(contenttypeid==12L||contenttypeid==14L||contenttypeid==28L){
    				contenttypeid=1L;
                 } else if(contenttypeid==32L){
                	 contenttypeid=2L;
                 } else if(contenttypeid==38L){
                	 contenttypeid=3L;
                 } else if(contenttypeid==39L){
                	 contenttypeid=4L;
                 }
                
    			
    			vo.setTitle(title2);
    			vo.setContentid(contentid2);
    			vo.setContenttypeid(contenttypeid);
    			vo.setAddress1(addr1);
    			vo.setAddress2(addr2);
    			vo.setTel(tel);
    			vo.setContent(overview);
    			vo.setImage1(firstimage);
    			vo.setMapx(mapx);
    			vo.setMapy(mapy);
    			vo.setZipcode(zipcode);
    			
    			lt.add(vo);
        		System.out.println("리스트:" + lt.size());
        		System.out.println("toString:" + vo.toString());
        		
    	}


	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	
	return lt;
}
}
