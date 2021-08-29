package org.acme.people;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;
import java.util.UUID;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.startsWith;

@QuarkusTest
public class GreetingResourceTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("/hello")
          .then()
             .statusCode(200)
             .body(is("hello quarkus!"));
    }

    // add moretests
    @Test
    public void testGreetingEndpoint() {
        String uuid = UUID.randomUUID().toString();
        given()
          .pathParam("name", uuid)
          .when().get("/hello/greeting/{name}")
          .then()
            .statusCode(200)
            .body(startsWith("你好 " + uuid));
    }

    @Test
    public void testEndPoint() {
        String name = "David";
        given()
            .pathParam("name", name)
            .when().get("/hello/greeting/{name}")
            .then()
                .statusCode(200)
                .body(startsWith("你好 " + name));
    }
}