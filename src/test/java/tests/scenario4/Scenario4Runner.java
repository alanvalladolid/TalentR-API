package tests.scenario4;

import com.intuit.karate.junit5.Karate;

public class Scenario4Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario4").relativeTo(getClass());
    }
}
