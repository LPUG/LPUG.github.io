.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[\.a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Install lpug.github.io requirements
	pip install --requirement requirements.txt

.PHONY: map
map: ## Download map image
	curl --output assets/static/map.png --silent "http://staticmap.openstreetmap.de/staticmap.php?center=51.33207,12.37347&zoom=19&size=1024x512&maptype=mapnik&markers=51.3321008,12.3734758,blues"

.PHONY: run
run: ## Start Lektor server
	lektor server
