package uuid;

import com.fasterxml.uuid.Generators;

public class GenerateUUID {

	/** 시간 기준으로 UUID생성. 유니크한 UUID라서 결제코드 등에 쓰면 좋을 메소드 */
	public static String generateUUID() {		
		return String.valueOf(Generators.timeBasedGenerator().generate());
	}

}
