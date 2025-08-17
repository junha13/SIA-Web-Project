package travellog;

import java.io.FileReader;
import java.io.Reader;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
// JSONParser 라이브러리 설치 (web-inf/lib)

public class JsonPileLoader {
	
	static JSONParser parser = new JSONParser(); // JSON 데이터를 파싱하기 위한 JSONParser 객체
	static String fileName = "/queries.json";
	
	static String getSqlQueryByJson(String key) {
		String query = null;
		
		try (Reader reader = new FileReader(fileName)) {
			JSONObject jsonObject = (JSONObject) parser.parse(reader); // JSON 파일을 파싱하여 JSONObject로 변환
			query = (String) jsonObject.get(key);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return query;
	}
}
