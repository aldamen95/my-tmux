languages=`echo "javascript css go lua golang cpp c ts nodejs js" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr  ' ' '\n'`
selected=`printf "$languages\n$core_utils" | fzf`
read -p "query: " query

if printf "$languages" | grep -qs "$selected"; then 
    tmux neww -n "$selected:$query" bash -c "curl cht.sh/$selected/`echo "$query" | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else 
    tmux neww -n "$selected:$query" bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
