vimrc
=====

my vim script   

vim8 release.  
install step:  

    cd src/  
    
    ./configure --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu  --enable-cscope --enable-multibyte --enable-fail-if-missing  
    make -j4 && make install

其中python2.7/config-这个需要安装libpython2.7， 以及python-dev (ps: debian下) 
yum install ncurses-devel   

TODO add skywind3000/asyncrun.vim 
