# tmux源码编译问题记录

```
tar -xzf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
    ./configure --prefix=${cur}
    make && make install
cd -
rm -rf libevent-2.1.8-stable
tar -xzf tmux-2.3.tar.gz
cd tmux-2.3
    ./configure --prefix=${cur} --enable-static CFLAGS=-I${cur}/include LDFLAGS=-L${cur}/lib/ && make && make install
cd -
rm -rf tmux-2.3
```

其中 tmux 编译过程中依然会出现找不到libevent的情况， 

```
./configure --prefix=/root/tmp --enable-static LIBEVENT_CFLAGS="-I${cur}include" LIBEVENT_LIBS="-L${cur}lib"
```

换成LIBEVENT_XXXX相关变量替换
