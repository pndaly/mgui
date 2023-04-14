HOME := $(shell /bin/echo $$MGUI_HOME)
include $(HOME)/cfg/Rules.MAKE
TARGETS = $(MGUI_SRC)
