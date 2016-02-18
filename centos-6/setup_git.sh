#!/bin/bash -v
yum update -y

#install git-2.0 from source
yum install gcc -y
yum install perl-ExtUtils-MakeMaker -y
yum install gettext -y
yum install libcurl-devel -y 
yum install zlib-devel -y

cd /
curl -k https://www.kernel.org/pub/software/scm/git/git-2.0.0.tar.gz > git.tar.gz
tar xvzf git.tar.gz
cd git-2.0.0
make configure 
./configure --prefix=/usr --without-tcltk
make all
make install

git --version

