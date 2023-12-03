package examples.rickMorty;

import com.intuit.karate.junit5.Karate;

class RickMortyRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("rickmorty").relativeTo(getClass());
    }    

}
