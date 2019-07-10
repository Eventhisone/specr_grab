#!/bin/bash
# Specr Grab is a tool for downloading html files.

# Klipper USA URL
KLIPPER="https://www.klipperusa.com/stringing/viewpattern.php?mfg=T"

# Manufacturers
ASICS="ASI"
BABOLAT="BAB"
DONNAY="DON"
DUNLOP="DUN"
FISCHER="FIS"
GAMMA="GAM"
HEAD="HED"
PRINCE="PRI"
PRO_KENNEX="PRK"
SLAZENGER="SLZ"
SPALDING="SPA"
TECHNIFIBRE="TEC"
VOLKL="VOL"
WEED="WEE"
WILSON="WIL"
YONEX="YON"

# List of Manufacturer slugs
PAGE_LINKS=("$ASICS" "$BABOLAT" "$DONNAY" "$DUNLOP" "$FISCHER" "$GAMMA" "$HEAD" "$PRINCE" "$PRO_KENNEX" "$SLAZENGER" "$SPALDING" "$TECHNIFIBRE" "$VOLKL" "$WEED" "$WILSON" "$YONEX")

for LINK in ${!PAGE_LINKS[*]}
do
    DEFAULT_FILE_NAME="viewpattern.php?mfg="

    wget --output-document="specs/${PAGE_LINKS[$LINK]}.html" "$KLIPPER${PAGE_LINKS[$LINK]}"
done

exit
