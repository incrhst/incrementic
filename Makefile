# Webflow Udesly Deploy Makefile

### Defensive settings for make:
#     https://tech.davis-hansson.com/p/make/
SHELL:=bash
.ONESHELL:
.SHELLFLAGS:=-xeu -o pipefail -O inherit_errexit -c
.SILENT:
.DELETE_ON_ERROR:
MAKEFLAGS+=--warn-undefined-variables
MAKEFLAGS+=--no-builtin-rules

# Project settings
REPONAME=`basename $(PWD)`
SOURCE=~/Downloads/$(REPONAME).zip 


# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`


# Top-level targets

.PHONY: all
all: update setup

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: .SHELLFLAGS:=-eu -o pipefail -O inherit_errexit -c
help: ## This help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: update
update:
	make pull
	# make unzip

.PHONY: setup
setup:
	cp roo-utils/netlify.toml .
	cp roo-utils/build.sh .

.PHONY: pull
pull:
	@echo "$(GREEN)==> Pulling the stuff $(RESET)"
	git pull

       
        

.PHONY: unzip
unzip:  ## unzip the source
	@echo "$(GREEN) ==> unpacking $(REPONAME).zip $(RESET)"
	unzip -o $(SOURCE)


.PHONY: reset_buy_content_from_us
reset_buy_content_from_us: ## keep buy content from us the same
	@echo "$(GREEN)==> reseting buy content from us from netlify $(RESET)"
	git checkout theme/buy-content

