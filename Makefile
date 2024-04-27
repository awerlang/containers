SUBDIRS = azure \
		  buildpack-deps \
		  browsers \
		  gui \
		  opensuse \
		  token \
		  vscode \
		  warsaw

.PHONY: build $(SUBDIRS)
build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

azure:			buildpack-deps gui
buildpack-deps:	opensuse
browsers:		gui
displaycal:		gui
gcc: 			opensuse
gui: 			opensuse
irpf: 			buildpack-deps jdk11
jdk8: 			gui
jdk11: 			gui
rust: 			gcc
token: 			buildpack-deps browsers
vscode:			buildpack-deps browsers
warsaw:			buildpack-deps browsers
