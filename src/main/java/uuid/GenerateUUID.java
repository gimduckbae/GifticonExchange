package uuid;

import java.util.UUID;

import com.fasterxml.uuid.Generators;

public class GenerateUUID {

	public static UUID generateUUID() {
		return Generators.timeBasedGenerator().generate();
	}

}
