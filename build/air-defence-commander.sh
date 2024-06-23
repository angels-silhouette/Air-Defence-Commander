#!/bin/sh
echo -ne '\033c\033]0;Air defence commander\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/air-defence-commander.x86_64" "$@"
