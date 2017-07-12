#!/bin/bash
if [ $# -lt 1 ];
then
    echo "server name not specified"
    echo "cp to local machine" 
    local=1
else
    local=0
    server=$1
fi

echo "start deploying dotfiles to $server"

file_dirs=("bash" "git" "python" "tmux")
for dir in "${file_dirs[@]}"
do
    echo -e "\ntransfer $dir files..."
    for f in $(ls $dir); do
        echo $f
        if [ $local == "1" ];
        then
            rsync $dir/$f ~/.$f
        else
            rsync $dir/$f $server:~/.$f
        fi
    done
done

echo -e "\ntransfer vim files..."
f="vim/vimrc"
echo $f
if [ $local == "0" ]
then
    rsync $f $server:~/.vimrc
    rsync -ravz vim/ $server:~/.vim/
    rsync -ravz ipython/ $server:~/.ipython/
else
    rsync $f ~/.vimrc
    rsync -ravz vim/ ~/.vim/
    rsync -ravz ipython/ ~/.ipython/
fi
