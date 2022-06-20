#!/bin/bash

# fits format found in data/profiles.json

echo "["
id=0
for f in app/images/streetviews/*_0.jpg; do
  city=`echo $f | cut -f 4 -d / | cut -f 1 -d _`
  f0=${f:4}
  f1=`echo $f0 | sed -e 's/_0./_90./'`
  if [ "$id" != "0" ]; then
    echo ,
  fi
  cat <<EOF
  {
    "id": $id,
    "name": "$city",
    "images": [
      "$f0",
      "$f1"
    ]
  }
EOF
  id=$(($id+1))
done
echo "]"
