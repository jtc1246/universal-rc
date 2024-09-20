if ! (ps aux | grep -q "[u]niversal_rc_update.sh"); then
    sh ~/.universal-rc/universal_rc_update.sh
    echo "update thread started"
fi