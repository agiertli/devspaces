FROM quay.io/devfile/universal-developer-image:ubi8-latest

USER 0

# Install Kubeseal
RUN go install github.com/bitnami-labs/sealed-secrets/cmd/kubeseal@main 
RUN echo "export PATH=\$PATH:/home/user/go/bin" >> /home/user/.bashrc && source /home/user/.bashrc

# Install oc neat
RUN kubectl krew install neat
RUN chmod -R 775 /home/user/.krew/store/neat

USER 10001

# install camel Jbang
RUN /home/user/.sdkman/candidates/jbang/current/bin/jbang trust add -o --fresh --quiet https://github.com/apache/camel/blob/HEAD/dsl/camel-jbang/camel-jbang-main/dist/CamelJBang.java
RUN /home/user/.sdkman/candidates/jbang/current/bin/jbang app install camel@apache/camel 
USER 0
RUN  chgrp -R 0 /home/user/.jbang && chmod -R g=u /etc/passwd /etc/group /home/user/.jbang
RUN  mkdir -p /home/user/.m2 && chgrp -R 0 /home/user/.m2 && chmod -R g=u /etc/passwd /etc/group /home/user/.m2
USER 10001

