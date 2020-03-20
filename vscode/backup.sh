#!/bin/bash

cp -r $(wslpath -a $APPDATA)/Code/User/snippets .
cp $(wslpath -a $APPDATA)/Code/User/keybindings.json .
cp $(wslpath -a $APPDATA)/Code/User/settings.json .
cmd.exe /c "code --list-extensions" > extensions.list
