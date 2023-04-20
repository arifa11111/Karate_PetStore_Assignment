package com.karate.store;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

class StoreRunner {
    
    @Karate.Test
    Karate testPetStore() {
        return Karate.run("store").relativeTo(getClass());
    }
}
