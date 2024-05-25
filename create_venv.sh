#!/usr/bin/env sh

set -e

virtual_env=.med_venv

if ! python3 -m virtualenv -p python3 .venv; then
  python3 -m venv $virtual_env
fi

echo 'export PYTHONPATH="$PYTHONPATH:'$(pwd)'/src"' >> $virtual_env/bin/activate

. $virtual_env/bin/activate

sudo apt-get remove openjdk-* -y
sudo apt-get install openjdk-21-jdk-headless -qq > /dev/null

wget http://www.philippe-fournier-viger.com/spmf/spmf.jar

pip install --upgrade pip
pip install -r requirements.txt

python -m ipykernel install --user --name=$virtual_env