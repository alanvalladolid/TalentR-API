package tests.scenario6;

import com.intuit.karate.junit5.Karate;

public class Scenario6Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario6").relativeTo(getClass());
    }
}
