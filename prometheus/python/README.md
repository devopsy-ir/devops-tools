With just two lines of code you can add a counter to any library or application. These counters are useful to track how many times errors and unexpected situations occur. While you probably don’t want to alert every single time there is an error, knowing how errors are trending over time is useful for debugging. But this is not restricted to errors. Knowing which are the most popular features and code paths of your application allows you to optimise how you allocate your development efforts.

To run:
1. Download prometheus from https://prometheus.io/download, extract it and then run it (/bin/bash prometheus) after copying file 'prometheus.yml' from here into the extracted prometheus dir!

2. Download prometheus node_exporter from url above, extraact it and then run it (/bin/bash ./node_exporter)

Prometheus expression:
rate(salam_islam_exceptions_total[1m])
/
rate(salam_islam_total[1m])

3. Run HAProxy using haproxy.cfg here!
	docker run -p 1235:1235 -v $PWD:/usr/local/etc/haproxy:ro haproxy:1.7

4. Run haproxy prometheus exporter:
	wget https://github.com/prometheus/haproxy_exporter/releases/download/v0.9.0/haproxy_exporter-0.9.0.linux-amd64.tar.gz
	tar -xzf haproxy_exporter-0.9.0.linux-amd64.tar.gz
	cd haproxy_exporter-0.9.0.linux-amd64/
	./haproxy_exporter --haproxy.scrape-uri 'http://localhost:1235/;csv'
