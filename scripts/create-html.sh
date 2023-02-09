#!/usr/bin/env bash

usage() {
  echo $0 TEMPLATE_NAME TITLE MARKDOWN_FILE
  echo "Example:"
  echo "$0 3mdeb-report-template \"Qualcomm EMMC dump report\" emmc-dump-qualcomm.md"
}

if [ $# -ne 3 ]; then
  usage
  exit 1
fi

TEMPLATE_NAME="$1"
TITLE="$2"
MARKDOWN_FILE="$3"

OUT_DIR="$(dirname $(readlink -f $MARKDOWN_FILE))"
MARKDOWN_FILE="$(basename $MARKDOWN_FILE)"

if [ ! -f $OUT_DIR/$MARKDOWN_FILE ]; then
  echo "Invalid file name: \"$OUT_DIR/$MARKDOWN_FILE\""
  usage
  exit 1
fi

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
TEMPLATE_DIR="$(dirname $SCRIPT_DIR)"

if [ ! -d $TEMPLATE_DIR ]; then
  echo "Invalid template name: \"$TEMPLATE_NAME\""
  usage
  exit 1
fi

TEMPLATE_PREFIX=$(realpath --relative-to="$OUT_DIR" "$TEMPLATE_DIR")

TEMPLATE_HTML=$TEMPLATE_NAME.html
OUTPUT_HTML=${MARKDOWN_FILE%.*}.html

cp $SCRIPT_DIR/../$TEMPLATE_NAME/$TEMPLATE_NAME.html $OUT_DIR/$OUTPUT_HTML
sed -e "s|@@TITLE@@|$TITLE|" -i $OUT_DIR/$OUTPUT_HTML
sed -e "s|@@MARKDOWN_FILE@@|$MARKDOWN_FILE|" -i $OUT_DIR/$OUTPUT_HTML
sed -e "s|@@TEMPLATE_PREFIX@@|$TEMPLATE_PREFIX|g" -i $OUT_DIR/$OUTPUT_HTML
