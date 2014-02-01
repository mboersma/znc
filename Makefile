build:
	docker build -rm -t mboersma/znc .

debug:
	docker run -p :6697:6697 -v ./state:/opt/znc/state -i -t mboersma/znc bash

start:
	docker run -p :6697:6697 -v ./state:/opt/znc/state -t mboersma/znc
