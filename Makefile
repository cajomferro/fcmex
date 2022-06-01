docker-build:
	docker build -t fcmex .

docker-run:
	docker run -it --rm \
		-v $(PWD)/lib:/opt/app/lib \
		-v $(PWD)/test:/opt/app/test \
		-v $(PWD)/config:/opt/app/config \
		fcmex bash