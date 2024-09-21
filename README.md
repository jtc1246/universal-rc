# universal-rc

## Introduction

Easily configure a global bashrc or zshrc file for all your devices. No need to set everything for all your devices.

## Usage

### Requirements

1. Have curl installed on your device.
2. Your system use bash or zsh as the main terminal.

### Installation

**Step 1:** Fork this repository, then edit the [bashrc.sh](bashrc.sh) to add your content. Note that you can only edit content between the `======` lines, do not change other content, unless you know what you are doing.

**Step 2:** Copy your github repository link, it should look like "https:<span>//github.com/xxxx/universal-rc", xxxx should be replaced with your username. Then run the following command:

```bash
curl -L -s "https://github.com/jtc1246/universal-rc/blob/main/install.sh?raw=True" | bash -s -- https://the_link_you_copied
```

https:\//the_link_you_copied should be replaced with your github repository link. Suppose your username is abcd1234, it should be "https:<span>//github.com/abcd1234/universal-rc".

**Step 3:** Launch a new terminal to take effect.

### Later Usage

1. You can use `universal-rc` or `universal-rc -h` to see the information.
2. Use `universal-rc update` to update the bashrc or zshrc file. (It will automatically update, but if you want to update immediately, you can use this command.)

### Other Notes

This will only install for the current user, not the whole system. To install for root, use `sudo -i`, then repeat the above process.

