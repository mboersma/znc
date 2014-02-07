build:
	docker build -t mboersma/znc .

shell:
	docker run -p :6697:6697 -v ./state:/opt/znc/state -i -t mboersma/znc /bin/bash

start:
	docker run -p :6697:6697 -v ./state:/opt/znc/state -t mboersma/znc
