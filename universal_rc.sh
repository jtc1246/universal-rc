if ! (ps aux | grep -q "[u]niversal_rc_update.sh"); then
    set +m; { nohup sh ~/.universal-rc/universal_rc_update.sh & }; set -m
fi

function universal-rc() {
    if [ $# -eq 0 ]; then
        echo "Universal-rc: Easily configure a global bashrc or zshrc file for all your devices."
        echo -n "Last check: "
        cat ~/.universal-rc/last_update.txt
        echo -n "Current link: "
        cat ~/.universal-rc/github_link.txt
        echo 'Use "universal-rc update" to update the bashrc file.'
        return 0
    fi

    if [ $# -eq 1 ]; then
        if [ "$1" = "update" ]; then
            sh ~/.universal-rc/universal_rc_update.sh 1
            result=$?
            if [ $result -eq 0 ]; then
                echo "Update successfully."
                return 0
            else
                echo "Failed to update the bashrc file, exit status: $result"
                return $result
            fi
        fi
        if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
            echo "Universal-rc: Easily configure a global bashrc or zshrc file for all your devices."
            echo 'Use "universal-rc update" to update the bashrc file.'
            return 0
        fi
        echo "Unrecognized command: $1"
        echo 'Use "universal-rc -h" for help.'
        return -1
    fi

    echo "Invalid number of arguments."
    echo 'Use "universal-rc -h" for help.'
    return -1
}
