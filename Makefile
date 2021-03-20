SUBDIRS = azure \
		  buildpack-deps \
		  displaycal \
		  firefox \
		  gcc \
		  gui \
		  irpf \
		  jdk8 \
		  jdk11 \
		  opensuse \
		  pgadmin \
		  rust \
		  token \
		  vscode \
		  warsaw

.PHONY: build $(SUBDIRS)
build: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@

azure:			buildpack-deps gui
buildpack-deps:	opensuse
displaycal:		gui
firefox: 		gui
gcc: 			opensuse
gui: 			opensuse
irpf: 			buildpack-deps jdk11
jdk8: 			gui
jdk11: 			gui
rust: 			gcc
token: 			buildpack-deps firefox
vscode:			buildpack-deps gui
warsaw:			buildpack-deps firefox
