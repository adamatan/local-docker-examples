PWD := $(shell pwd)

all: pdf

pdf:
	docker run --mount type=bind,source="$(PWD)",target=/data -w=/data --rm blang/latex:ubuntu pdflatex article.tex

imagemagick:
	docker build . -t imagemagick
	docker run -it --rm --mount type=bind,source="$(PWD)",target=/images imagemagick bash
# convert pexels-tyler-lastovich-633198.jpg -gravity North -font Merienda-Regular.ttf  -pointsize 30 -annotate +0+100 'Imagemagick on Docker' output.jpg

clean:
	rm *.log *.pdf *.aux