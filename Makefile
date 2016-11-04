DOCS=./docs

setup: revealjs
	@pip install -r requirements.txt

build: clean
	@echo "Gerando os slides para HTML..."
	@python build.py

revealjs:
	@git submodule init
	@git submodule update

clean:
	@rm -rf $(DOCS)/*.html

run:
	@cd docs && python -m http.server 8080

.PHONY: setup build revealjs clean run
