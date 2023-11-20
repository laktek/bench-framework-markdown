cd punch

rm -rf dist/
rm -rf ./src/contents/posts/*.md
echo "[bench] Clean complete"

if [ -z "$1" ]
  then count="1000"
else
  count="$1"
fi
cp ../_markdown-samples/$count/* ./src/contents/posts
echo "[bench] Setup complete $count pages"

deno run -A ./setup-punch-json.js
echo "[bench] Updated punch.json"

time ./punch build src/
echo "[bench] Build complete $count pages"

echo "[bench] Framework version"

rm -rf ./src/contents/posts/*.md
echo "[bench] Posts cleanup complete"
