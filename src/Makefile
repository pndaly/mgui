HOME := $(shell echo $$MGUI_HOME)
include $(HOME)/cfg/Rules.MAKE

EVERYTHING: Everything
Everything: Clean All Install

CLEAN: Clean
Clean:
	rm -f $(MGUI_SRC)/tclIndex >> /dev/null 2>&1
	rm -f $(MGUI_BIN)/mgui

ALL: All
All:
	touch $(MGUI_CFG)/*
	touch $(MGUI_ETC)/*
	touch $(MGUI_SRC)/*.tcl
	chmod 755 $(MGUI_SRC)/*.tcl

INSTALL: Install
Install:
	cp -pf $(MGUI_SRC)/mgui.tcl $(MGUI_BIN)/mgui
	cp -pf $(MGUI_CFG)/mgui.vars.backup $(MGUI_CFG)/mgui.vars
	cp -pf $(MGUI_CFG)/5point_offsets.tsv $(MGUI_TSV)/5point_offsets.tsv
