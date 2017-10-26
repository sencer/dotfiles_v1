#!/usr/bin/env bash

function bloomberg {
  curl -s https://www.bloomberg.com/markets/api/quote-page/${1}:CUR | jq '.["basicQuote"]|[.price, .lowPrice, .highPrice, .priceTime ]|@sh'|xargs
}
usd=( $(bloomberg USDTRY) )
eur=( $(bloomberg EURTRY) )
gld=( $(bloomberg XAUUSD) )
echo "${usd[0]:-_}"
echo "---"
echo "USDTRY ${usd[0]}|font=monospace" | xargs
echo "--Low  : ${usd[1]}|font=monospace href='https://www.bloomberg.com/quote/USDTRY:CUR'"
echo "--High : ${usd[2]}|font=monospace href='https://www.bloomberg.com/quote/USDTRY:CUR'"
echo "EURTRY ${eur[0]}|font=monospace" | xargs
echo "--Low  : ${eur[1]}|font=monospace href='https://www.bloomberg.com/quote/EURTRY:CUR'"
echo "--High : ${eur[2]}|font=monospace href='https://www.bloomberg.com/quote/EURTRY:CUR'"
echo "GOLD   ${gld[0]}|font=monospace" | xargs
echo "--Low  : ${gld[1]}|font=monospace href='https://www.bloomberg.com/quote/XAUUSD:CUR'"
echo "--High : ${gld[2]}|font=monospace href='https://www.bloomberg.com/quote/XAUUSD:CUR'"
