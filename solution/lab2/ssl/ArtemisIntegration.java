// camel-k: language=java

import org.apache.camel.builder.RouteBuilder;

public class ArtemisIntegration extends RouteBuilder {

    @Override
    public void configure() throws Exception {

        // Write your routes here, for example:
        from("timer:java?period={{time:1000}}").routeId("java")
            .setBody()
                .simple("Hello Camel from ${routeId}")
            .log("${body}")
           .to("kamelet:custom-jms-amqp-10-sink?destinationType=topic&destinationName=user1-dev&remoteURI=amqps://rhte-artemis-one-way-ssl-0-svc.tooling.svc.cluster.local:5673&trustStoreLocation=/etc/ssl/jms-sink/client.ts&trustStorePassword=password1!&username=admin&password=password1!");
    }
}
