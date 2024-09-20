# export GITHUB_LINK=""

if [ $# -eq 0 ]; then
    # no argument, check updates forever
fi

if [ $# -eq 1 ]; then
    # one argument, update once
    rm -rf ~/.universal-rc/bashrc.sh
    curl -o ~/.universal-rc/bashrc.sh "$GITHUB_LINK/bashrc.sh?raw=True"
fi