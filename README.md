docker-serf
==================

Base docker image to run a serf (http://www.serfdom.io) agent


Usage
-----

To create the image `luis/serf`, execute the following command on the docker-serf folder:

	sudo docker build -t luis/serf .

Use with fig
------------------------

	serf:
	  image: luis/serf
	  ports:
	   - "7373"
	   - "7946"
	lb:
	  image: luis/haproxy
	  ports:
	    - "8001:80"
	  links:
	    - serf
	  environment:
	    HAPROXY_PASSWORD: yourpassword
	  volumes:
	   - "/var/log/docker:/var/log/supervisor"

Link your web containers to serf, not the the load balancer directly