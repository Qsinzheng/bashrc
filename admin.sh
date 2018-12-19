#!/bin/bash
# script to deploy .bashrc.ext profile, by Qsinzheng at 20181214

[ $# -lt 3 -o "$1" == "-h" -o "$1" == "-h" ]  && 
    echo "usage  : $0 action   profile-type bashrc-ext-profile | vimrc-ext-profile" &&
    echo "example: $0 deploy   bashrc       .bashrc.ext.linux"   &&
    echo "example: $0 deploy   bashrc       .bashrc.ext.mac"     &&
    echo "example: $0 deploy   bashrc       .bashrc.ext.dev"     &&
    echo "example: $0 undeploy bashrc       .bashrc.ext.cyg"     &&
    echo "example: $0 deploy   vimrc        .vimrc.ext.simple.vim"   &&
    echo "example: $0 deploy   vimrc        .vimrc.ext.enhanced.vim" &&
    echo "example: $0 deploy   vimrc        .vimrc.ext.linux.vim"    &&
    echo "example: $0 undeploy vimrc        .vimrc.ext.mac.vim"      && exit 1;
Action=$1;
ProfileType=$2;
shift 2;
Profiles="$@";

case "$ProfileType" in
    "bashrc")
        cd "bashrc.ext"
            ./admin.sh "$Action" $Profiles
        cd - 1>/dev/null
        ;;
    "vimrc")
        cd "vimrc.ext"
            ./admin.sh "$Action" $Profiles
        cd - 1>/dev/null
        ;;
    *)
        echo "UNsupported profile type:<$ProfileType>"
        ;;
esac

