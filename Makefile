#
PACKAGENAME ?= ansible-docker-host
VERSION ?= latest

version:
	@echo $(PACKAGENAME) $(VERSION)
package: build
	@echo '# $@ STARTING'
	@bash ./tools/package.sh $(PACKAGENAME) $(VERSION)
	@echo '# $@ SUCCESS'
clean:
	rm -rf dist ||true

.PHONY: test
build:
	@echo '# $@ STARTING'
	bash build.sh $(PACKAGENAME) $(VERSION) ANSIBLE_GALAXY_FORCE="-f"
	@echo '# $@ SUCCESS'

test: build unit-test
	@echo '# $@ SUCCESS'


unit-test:
	@echo '# $@ STARTING'
	( cd tests && bash unit-test.sh $(PACKAGENAME) $(VERSION) )
	@echo '# $@ SUCCESS'

publish: package dist/$(PACKAGENAME)-$(VERSION).tar.gz
	@echo "# $@ STARTING"
	bash ./tools/publish.sh $(PACKAGENAME) $(VERSION)
	@echo '# $@ SUCCESS'
