FROM ubuntu:14.04
MAINTAINER 2e1hnk@deadbeef.cafe

RUN apt-get update && apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository ppa:webupd8team/java

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections

RUN apt-get update && apt-get install -y oracle-java8-installer maven

ADD ../hamtelligence.scraper /usr/local/scraper
RUN cd /usr/local/scraper && mvn assembly:assembly
CMD ["java", "-cp", "/usr/local/scraper/target/scraper-1.0-jar-with-dependencies.jar", "cafe.deadbeef._2e1hnk.hamtelligence.scraper.Scraper"]