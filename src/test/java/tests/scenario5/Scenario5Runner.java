package tests.scenario5;

import com.intuit.karate.junit5.Karate;

public class Scenario5Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario5").relativeTo(getClass());
    }
}
