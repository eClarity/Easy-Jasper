#! /bin/bash
# Created by David Pereira
# inexhero@gmail.com

echo 'Welcome to Jasper Easy Install'
wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py
sudo python get-pip.py
sudo apt-get update
sudo apt-get upgrade --yes
sudo apt-get install subversion autoconf libtool automake gfortran g++ vim git-core espeak festival festvox-don flite libttspico-utils python-pymad python-dev bison libasound2-dev libportaudio-dev python-pyaudio build-essential zlib1g-dev flex libasound2-dev libesd0-dev libsndfile1-dev --yes
sudo pip install --upgrade setuptools
git clone https://github.com/jasperproject/jasper-client.git jasper
sudo pip install -r jasper/client/requirements.txt
chmod +x jasper/jasper.py

sudo apt-get install python-pocketsphinx pocketsphinx-hmm-wsj1 pocketsphinx-lm-wsj
svn co https://svn.code.sf.net/p/cmusphinx/code/trunk/cmuclmtk/
cd cmuclmtk/
sudo ./autogen.sh && sudo make && sudo make install
cd ..

#! /bin/bash
wget http://distfiles.macports.org/openfst/openfst-1.3.3.tar.gz
wget https://mitlm.googlecode.com/files/mitlm-0.4.1.tar.gz
wget https://m2m-aligner.googlecode.com/files/m2m-aligner-1.2.tar.gz
wget https://phonetisaurus.googlecode.com/files/phonetisaurus-0.7.8.tgz

tar -xvf m2m-aligner-1.2.tar.gz
tar -xvf openfst-1.3.3.tar.gz
tar -xvf phonetisaurus-0.7.8.tgz
tar -xvf mitlm-0.4.1.tar.gz

cd openfst-1.3.3/
sudo ./configure --enable-compact-fsts --enable-const-fsts --enable-far --enable-lookahead-fsts --enable-pdt
sudo make install # come back after a really long time
cd ..

cd m2m-aligner-1.2/
sudo make
cd ..

cd mitlm-0.4.1/
sudo ./configure
sudo make install
cd ..

cd phonetisaurus-0.7.8/
cd src
sudo make
cd ..

sudo cp m2m-aligner-1.2/m2m-aligner /usr/local/bin/m2m-aligner
sudo cp phonetisaurus-0.7.8/phonetisaurus-g2p /usr/local/bin/phonetisaurus-g2p

wget http://phonetisaurus.googlecode.com/files/g014b2b.tgz
tar -xvf g014b2b.tgz

cd g014b2b/
./compile-fst.sh
cd ..

mv ~/g014b2b ~/phonetisaurus


tar -xvf julius-4.3.1.tar.gz

cd julius-4.3.1
./configure --enable-words-int
make
sudo make install

sudo pip install --upgrade gTTS
