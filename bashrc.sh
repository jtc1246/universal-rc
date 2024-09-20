#!/bin/bash

alias pass=true


# ============= Start of your bashrc commands ============




# =============== End for your commands ==================


if [ $(uname) = "Darwin" ]; then
# ============ This part only valid for MacOS ============
    # Replace "pass" with your commands
    pass
# ================== End for MacOS part ==================
fi


if [ $(uname) = "Linux" ]; then
# ============ This part only valid for Linux ============
    # Replace "pass" with your commands
    pass
# ================== End for Linux part ==================
fi


if [ $(id -u) = "0" ]; then
# ============= This part only valid for root ============
    # Replace "pass" with your commands
    pass
# =================== End for root part ==================
fi


if [ $(id -u) != "0" ]; then
# =========== This part only valid for non-root ==========
    # Replace "pass" with your commands
    pass
# ================= End for non-root part ================
fi


if uname -a | grep -q "Ubuntu"; then
# ============ This part only valid for Ubuntu ===========
    # Replace "pass" with your commands
    pass
# ================== End for Ubuntu part =================
fi


if apt --version >/dev/null 2>&1; then
# ====== This part only valid for systems using apt ======
    # Replace "pass" with your commands
    pass
# ============ End for systems using apt part ============
fi


if cat /proc/1/cgroup > /dev/null 2>&1 && cat /proc/1/cgroup | grep -q "docker"; then
# ============ This part only valid for docker ===========
    # Replace "pass" with your commands
    pass
# ================== End for docker part =================
fi
