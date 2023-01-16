import org.apache.camel.builder.RouteBuilder;

public class MutableIntegration extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        // Write your routes here, for example:
        from("timer:java?period={{time:1000}}").routeId("student")
            .setBody()
                .simple("Hello Camel from ${routeId}")
          .to("log:info");
    }
}