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



### YouCompleteMe 安装

add Plug 'Valloric/YouCompleteMe'
Plugged目录下， 

https://github.com/ycm-core/YouCompleteMe

git submodule update --init --recursive

python3 install.py --clang-compiler

查找系统include文件
echo | clang -v -E -x c++ -;

补充.ycm_extra_conf.py配置for cpp

```
def Settings(**kwargs):
      return {'flags': [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-DNDEBUG',
        '-std=c++',
        '-isystem',
        '/usr/include',
        '-isystem',
        '/usr/local/include',
        '-isystem',
        '/usr/include/c++/7',
        '-isystem',
        '/usr/include/x86_64-linux-gnu/c++/7',
        '-isystem',
        '/usr/include/c++/7/backward',
        '-I',
        '.'
]}
```


TODO add Plug 'dense-analysis/ale'
TODO add Plug 'Yggdroot/LeaderF'
TODO add Plug 'Shougo/echodoc.vim'
TODO add Plug 'octol/vim-cpp-enhanced-highlight'

TODO add skywind3000/asyncrun.vim 
