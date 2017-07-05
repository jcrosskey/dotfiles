#!/bin/bash
if [ $# -lt 1 ];
then
    echo "server name not specified"
    exit 0
fi

server=$1
echo "start deploying dotfiles to $server"

file_dirs=("bash" "git" "python" "tmux")
for dir in "${file_dirs[@]}"
do
    echo -e "\ntransfer $dir files..."
    for f in $(ls $dir); do
        echo $f
        rsync $dir/$f $server:~/.$f
    done
done

echo -e "\ntransfer vim files..."
f="vim/vimrc"
echo $f
rsync $f $server:~/.vimrc
rsync -ravz vim $server:~/.vim
