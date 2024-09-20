package tests.scenario7;

import com.intuit.karate.junit5.Karate;

public class Scenario7Runner {
    @Karate.Test
    Karate testAll() {
        return Karate.run("scenario7").relativeTo(getClass());
    }
}
