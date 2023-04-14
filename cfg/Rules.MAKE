#///////////////////////////////////////////////////////////////////////////////
#// directory structure(s)
#///////////////////////////////////////////////////////////////////////////////
HERE      := $(shell pwd)
HOME      := $(shell echo $$HOME)
MGUI_HOME := $(shell echo $$MGUI_HOME)
MGUI_BIN   = $(MGUI_HOME)/bin
MGUI_CFG   = $(MGUI_HOME)/cfg
MGUI_ETC   = $(MGUI_HOME)/etc
MGUI_SRC   = $(MGUI_HOME)/src
MGUI_TSV   = $(MGUI_HOME)/tsv

#///////////////////////////////////////////////////////////////////////////////
#// help
#///////////////////////////////////////////////////////////////////////////////
help:
	clear
	@echo ""
	@echo "MGUI $(HERE) Makefile (c) 2023, Steward Observatory (UA). All rights reserved."
	@echo "Released under the GPL."
	@echo ""
	@echo "To re-build the code, use:"
	@echo ""
	@echo "% cd $(MGUI_HOME)"
	@echo "% make everything"
	@echo ""
	@echo "or"
	@echo ""
	@echo "% cd $(MGUI_SRC)"
	@echo "% make Everything"
	@echo ""

#///////////////////////////////////////////////////////////////////////////////
#// dump
#///////////////////////////////////////////////////////////////////////////////
dump: help
	@echo "HERE         = $(HERE)"
	@echo "HOME         = $(HOME)"
	@echo "MGUI_HOME    = $(MGUI_HOME)"
	@echo "MGUI_BIN     = $(MGUI_BIN)"
	@echo "MGUI_CFG     = $(MGUI_CFG)"
	@echo "MGUI_ETC     = $(MGUI_ETC)"
	@echo "MGUI_SRC     = $(MGUI_SRC)"
	@echo "MGUI_TSV     = $(MGUI_TSV)"
	@echo "TARGETS      = $(TARGETS)"
	@echo ""

#///////////////////////////////////////////////////////////////////////////////
#// everything
#///////////////////////////////////////////////////////////////////////////////
all:
	-for target in $(TARGETS); do\
	 cd $$target;\
	 make ALL;\
	 cd ${PWD};\
	done

clean:
	rm -f $(MGUI_SRC)/tclIndex >> /dev/null 2>&1
	-for target in $(TARGETS); do\
	 cd $$target;\
	 make CLEAN;\
	 cd ${PWD};\
	done

install:
	-for target in $(TARGETS); do\
	 cd $$target;\
	 make INSTALL;\
	 cd ${PWD};\
	done

everything: clean all install
