FROM jenkins/jenkins:lts-jdk8
COPY --chown=jenkins:jenkins files/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --verbose -f /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --verbose -p job-dsl
