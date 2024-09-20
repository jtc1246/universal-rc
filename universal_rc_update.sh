# export GITHUB_LINK="https://github.com/jtc1246/universal-rc"

echo "$GITHUB_LINK/blob/main/bashrc.sh" > ~/.universal-rc/github_link.txt

if [ $# -eq 0 ]; then
    # no argument, check updates forever
    while true;
    do
        curl -s -f -L -o ~/.universal-rc/bashrc.sh "$GITHUB_LINK/blob/main/bashrc.sh?raw=True" && date > ~/.universal-rc/last_update.txt
        sleep 300
    done
fi

if [ $# -eq 1 ]; then
    # one argument, update once
    curl -f -L -o ~/.universal-rc/bashrc.sh "$GITHUB_LINK/blob/main/bashrc.sh?raw=True" && date > ~/.universal-rc/last_update.txt
fi
