#!/bin/bash
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "                      FILE ORGANIZER                         "
echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo " "
read -p "ENTER THE DIRECTORY NAME: " SOURCE

if [ ! -d "$SOURCE" ]; then
  echo "DIRECTORY NOT FOUND"
  exit 1
fi

echo "DIRECTORY FOUND"

IMAGES_DIR="$SOURCE/Images"
DOCS_DIR="$SOURCE/Documents"
TEXT_DIR="$SOURCE/Text"
ARCHIVES_DIR="$SOURCE/Archives"


echo "Creating category folders"

mkdir -p "$IMAGES_DIR"
mkdir -p "$DOCS_DIR"
mkdir -p "$TEXT_DIR"
mkdir -p "$ARCHIVES_DIR"

echo "FOLDERS created successfully!"

echo "Organizing files..."

for FILE in "$SOURCE"/*; do
     if [ -f "$FILE" ]; then

         case "$FILE" in
		*.jpg|*.jpeg|*.png)
			mv "$FILE" "$IMAGES_DIR/"
			;;
    		*.pdf|*.doc|*.docx)
			mv "$FILE" "$DOCS_DIR/"
			;;
		*.txt)
			mv "$FILE" "$TEXT_DIR/"
                        ;;
                *.zip|*.tar.gz|*.rar)
          		mv "$FILE" "$ARCHIVES_DIR/"
			;;
         esac
     fi
done


echo "FILE Organization compele!"
