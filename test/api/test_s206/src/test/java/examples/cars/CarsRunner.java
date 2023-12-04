package examples.cars;

import com.intuit.karate.junit5.Karate;

class CarsRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("cars").relativeTo(getClass());
    }    

}
