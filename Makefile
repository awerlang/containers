SUBDIRS = buildpack-deps \
		  displaycal \
		  firefox \
		  gcc \
		  gui \
		  irpf \
		  jdk8 \
		  opensuse \
		  proxy \
		  rust \
		  token \
		  vscode \
		  warsaw

.PHONY: build $(SUBDIRS)
build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

buildpack-deps:	opensuse
displaycal:		gui
firefox: 		gui
gcc: 			opensuse
gui: 			opensuse
irpf: 			buildpack-deps jdk8
jdk8: 			gui
opensuse:		proxy
rust: 			gcc
token: 			buildpack-deps firefox
vscode:			buildpack-deps gui
warsaw:			buildpack-deps firefox
