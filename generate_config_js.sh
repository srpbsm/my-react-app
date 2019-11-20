#!/bin/sh -eu
if [ -z "${BRAND:-}" ]; then
    BRAND_JSON=undefined
else
    BRAND_JSON=$(jq -n --arg brand $BRAND '$brand')
fi
if [ -z "${COUNTRY:-}" ]; then
    COUNTRY_JSON=undefined
else
    COUNTRY_JSON=$(jq -n --arg country $COUNTRY '$country')
fi
if [ -z "${BACKEND:-}" ]; then
    BACKEND_JSON=undefined
else
    BACKEND_JSON=$(jq -n --arg backend $BACKEND '$backend')
fi
 
cat <<EOF
window.REACT_APP_BRAND=$BRAND_JSON;
window.REACT_APP_COUNTRY=$COUNTRY_JSON;
window.REACT_BACKEND=$BACKEND_JSON
EOF