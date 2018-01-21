# bin/sh

cd $(dirname $0)/..
rm -rf build
mkdir build
cp -r lp/img build/img
cp -r lp/css build/css
bundle exec haml lp/index.html.haml build/index.html

if [ "$1" == "deploy" ]; then
  aws s3 cp build s3://osafes/ --recursive
fi
