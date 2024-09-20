if [ $# -eq 0 ]; then
    echo "Please provide the link of your github repository."
    exit -1
fi

export GITHUB_LINK=$1

if ! [[ $GITHUB_LINK =~ ^https:// ]]; then
    echo "Invalid link, please provide a valid link."
    exit -1
fi

rm -rf ~/.universal-rc
mkdir ~/.universal-rc

success="true"

curl -H "Cache-Control: no-cache" -f -L -o ~/.universal-rc/universal_rc.sh "https://github.com/jtc1246/universal-rc/blob/main/universal_rc.sh?raw=True"
status=$?
if [ $status -ne 0 ]; then
    success="false"
fi
curl -f -L -o ~/.universal-rc/universal_rc_update_tmp.sh "https://github.com/jtc1246/universal-rc/blob/main/universal_rc_update.sh?raw=True"
status=$?
if [ $status -ne 0 ]; then
    success="false"
fi
curl -f -L -o ~/.universal-rc/bashrc_append.sh "https://github.com/jtc1246/universal-rc/blob/main/bashrc_append.sh?raw=True"
status=$?
if [ $status -ne 0 ]; then
    success="false"
fi
curl -f -L -o ~/.universal-rc/quiet.sh "https://github.com/jtc1246/universal-rc/blob/main/quiet.sh?raw=True"
status=$?
if [ $status -ne 0 ]; then
    success="false"
fi

if [ "$success" = "false" ]; then
    echo "Failed to download the files from github, please try again."
    rm -rf ~/.universal-rc
    exit -1
fi

echo -n "export GITHUB_LINK=" > ~/.universal-rc/universal_rc_update.sh
echo -n '"' >> ~/.universal-rc/universal_rc_update.sh
echo -n "$GITHUB_LINK" >> ~/.universal-rc/universal_rc_update.sh
echo '"' >> ~/.universal-rc/universal_rc_update.sh
echo "" >> ~/.universal-rc/universal_rc_update.sh
cat ~/.universal-rc/universal_rc_update_tmp.sh >> ~/.universal-rc/universal_rc_update.sh
rm -rf ~/.universal-rc/universal_rc_update_tmp.sh

sh ~/.universal-rc/universal_rc_update.sh 1
status=$?
if [ $status -ne 0 ]; then
    echo "Failed to download your bashrc file from the github repository you provided, please check the link."
    rm -rf ~/.universal-rc
    exit -1
fi

bashrc_file=""
if [ $(uname) = "Darwin" ]; then
    bashrc_file=".zshrc"
else
    if [ -f ~/.bashrc ]; then
        bashrc_file=".bashrc"
    else
    if [ -f ~/.bash_profile ]; then
        bashrc_file=".bash_profile"
    else
        echo "Failed to find the bashrc file on your system, please use a system that supports bashrc files."
        rm -rf ~/.universal-rc
        exit -1
    fi
    fi
fi

cd ~

cat ~/.universal-rc/bashrc_append.sh >> $bashrc_file

echo 'Universal-rc setup successfully. Please open a new terminal to take effect. Use "universal-rc" or "universal-rc -h" for more information.'
