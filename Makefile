PWD := $(shell pwd)

all: pdf imagemagick

pdf:
	# Uses an image from Dockerhub to run pdflatex
	docker run --mount type=bind,source="$(PWD)"/data,target=/data -w=/data --rm blang/latex:ubuntu pdflatex article.tex

imagemagick:
	# Build an image locally and runs imagemagick
	
	# Create the iamge from the Dockerfile
	docker build . -t imagemagick

	# Run imagemagick from the docker image
	docker run -it --rm --mount type=bind,source="$(PWD)",target=/images imagemagick \
		convert data/pexels-tyler-lastovich-633198.jpg \
			-gravity North -font Merienda-Regular.ttf  \
			-pointsize 30 -annotate +0+100 'Imagemagick on Docker' data/output.jpg

clean:
	rm data/*.log data/*.pdf data/*.aux data/output.jpg
