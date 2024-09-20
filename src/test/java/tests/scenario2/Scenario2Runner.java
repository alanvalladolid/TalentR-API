package tests.scenario2;

import com.intuit.karate.junit5.Karate;

public class Scenario2Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario2").relativeTo(getClass());
    }
}
