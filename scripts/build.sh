# bin/sh

cd $(dirname $0)/..
haml lp/index.html.haml build/index.html
rm -rf build
mkdir build
cp -r lp/img build/img

if [ $1 == "deploy" ]; then
  envchain aws aws s3 cp build s3://osafes/ --recursive
fi
