package tests.scenario3;

import com.intuit.karate.junit5.Karate;

public class Scenario3Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario3").relativeTo(getClass());
    }
}
