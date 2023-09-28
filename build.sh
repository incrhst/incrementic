sed -i s/document\.createElement\(\"udesly-banner\"\)// theme/*.html
sed -i s/document\.createElement\(\"udesly-banner\"\)// theme/*/*.html
#find theme -type f -name "*.html" -exec sh -c '
#    for file do
#        tmpfile=$(mktemp)
#        sed "$ d" "$file" > "$tmpfile" && echo "</body>" >> "$tmpfile" && mv "$tmpfile" "$file"
#    done
#' sh {} +
npm run build
cp robots-production.txt public/robots.txt
