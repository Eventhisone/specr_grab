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

DATE="$(date '+%Y-%m-%d')"
ARCHIVE_FOLDER="archive/$DATE"

# Check for an archive folder to place the download files
if [ ! -d $ARCHIVE_FOLDER ]; then
    #echo "mkdir -p archive/$DATE"
    mkdir -p $ARCHIVE_FOLDER
else
    echo "There is already an archive for today"
    echo "Exiting"
    exit
fi

for LINK in ${!PAGE_LINKS[*]}
do
    DEFAULT_FILE_NAME="viewpattern.php?mfg="

    #echo "$ARCHIVE_FOLDER/${PAGE_LINKS[$LINK]}.html"
    wget --output-document="$ARCHIVE_FOLDER/${PAGE_LINKS[$LINK]}.html" "$KLIPPER${PAGE_LINKS[$LINK]}"
done

echo "Symlinking $ARCHIVE_FOLDER to specs"
ln -s $ARCHIVE_FOLDER specs

exit
