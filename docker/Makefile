all:
	$(eval CURTIME := $(shell date +%Y%m%d-%H%M))
	docker build -t fdupoux/asciidoctor:$(CURTIME) -t fdupoux/asciidoctor:latest .
