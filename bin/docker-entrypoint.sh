#!/bin/sh
set -e
echo "**** convert reST to HTML ****"
cd ${DOC_DIR}
make html
echo "**** done ****"
echo "**** convert HTML to PDF ****"
wkhtmltopdf \
${DOC_DIR}/build/html/index.html ${DOC_DIR}/build/${DOC_NAME}.pdf
echo "**** done ****"
