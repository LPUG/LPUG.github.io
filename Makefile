.PHONY: install run

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "    install          to install lpug.github.io requirements"
	@echo "    map              to download map image"
	@echo "    run              to start lektor server"

install:
	pip install -r requirements.txt

map:
	curl --output assets/static/map.png --silent "http://staticmap.openstreetmap.de/staticmap.php?center=51.33207,12.37347&zoom=19&size=1024x512&maptype=mapnik&markers=51.3321008,12.3734758,blues"

run:
	lektor server
