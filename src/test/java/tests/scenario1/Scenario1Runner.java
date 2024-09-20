package tests.scenario1;

import com.intuit.karate.junit5.Karate;

public class Scenario1Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario1").relativeTo(getClass());
    }
}
