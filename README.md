# MGUI

A simple graphical user interface for dithering and multi-colour sequencing using Mont4k on the Kuiper 61-inch telescope.

The output(s) are tab-separated-value (.tsv) files suitable for ingestion into the ARTN-ORP using the
`file upload` mechanism.

## Build

 ```bash
  % cd <path>/mgui
  % source etc/mgui.sh `pwd`
  % mkdir $MGUI_BIN
  % cd $MGUI_HOME
  % make everything
 ```

## Run

 ```bash
  % cd <path>/mgui
  % source etc/mgui.sh `pwd`
  % mgui &  
 ```

## Reset

 ```bash
  % cd <path>/mgui
  % source etc/mgui.sh `pwd`
  % cd $MGUI_CFG
  % cp -pf mgui.vars.backup mgui.vars
  % cp -pf 5point_offsets.tsv $MGUI_TSV/5point_offsets.tsv
 ```

-----------------------------------------------------------------------------------------------------------------

Last Modified: 20230413

Last Author: Phil Daly (pndaly@arizona.edu)
