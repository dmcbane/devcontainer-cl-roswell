build:
	docker build -t commonlispbr/roswell:latest .

publish: build
	docker push commonlispbr/roswell:latest
