replace =									\
	sed 's/£{'$(1)'}/'$(2)'/g' $(3) > $(4)

clean:
	rm -rf build/

update-emily:
	npm update emily

build.js:
	$(call replace,module,$(MODULE),templates/build.js,build.js)

build:
	r.js -o build.js

README.md:
	cp templates/README.md pack/
	$(call replace,name,$(NAME),templates/README.md,pack/README.md)

main.js:
	cp templates/main.js pack/

package.json:
	cp templates/package.json pack/

.PHONY: update-emily README.md
