# bin/sh

set -ex

cd $(dirname $0)/..
rm -rf build
mkdir -p build/archives/2018winter
mkdir -p build/archives/2018summer
mkdir -p build/archives/2019spring
mkdir -p build/archives/2019autumn
cp -r lp/img build/img
cp -r lp/css build/css
bundle exec haml lp/archives/2018winter/index.html.haml build/archives/2018winter/index.html
bundle exec haml lp/archives/2018summer/index.html.haml build/archives/2018summer/index.html
bundle exec haml lp/archives/2019spring/index.html.haml build/archives/2019spring/index.html
bundle exec haml lp/archives/2019autumn/index.html.haml build/archives/2019autumn/index.html
bundle exec haml lp/index.html.haml build/index.html

if [ "$1" == "deploy" ]; then
  aws s3 cp build s3://osafes/ --recursive
fi
