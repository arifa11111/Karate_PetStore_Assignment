package com.karate.user;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

class UserRunner {
    
    @Karate.Test
    Karate testPetStore() {
        return Karate.run("user").relativeTo(getClass());
    }
}
