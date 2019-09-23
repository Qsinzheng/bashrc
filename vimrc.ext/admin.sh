#!/bin/bash
# script to deploy .vimrc.ext profile, by Qsinzheng at 20181214

[ $# -lt 2 -o "$1" == "-h" -o "$1" == "-h" ]  && 
    echo "usage  : $0 action    vimrc-ext-profile"                &&
    echo "example: $0 deploy   .vimrc.ext.entry.elementary.vim"   &&
    echo "example: $0 deploy   .vimrc.ext.entry.advanced.vim"     &&
    echo "example: $0 deploy   .vimrc.ext.entry.linux.vim"        &&
    echo "example: $0 undeploy .vimrc.ext.mac.vim"                && exit 1;
Action="$1";
shift 1;
VimRCProfile="$@";
VimRCProfileSuit=(.vimrc.ext.*);

   MyProfile=~/.vimrc
VimRCExtDir=~/.vimrc.ext
[ ! -f "$MyProfile"   ] && touch "$MyProfile"
[ ! -f "$VimRCExtDir" ] && mkdir -p "$VimRCExtDir"

# deploy the basis .vimrc.ext profile
if [ "$Action" == "deploy" ]; then
    for profile in ${VimRCProfileSuit[@]}; do
        cp -p "$profile" "$VimRCExtDir"
    done
fi

# deploy the specified .vimrc.ext profile
for profile in $VimRCProfile; do
    [ ! -f "$profile" ] && continue;
    SourceLine="source ~/.vimrc.ext/$profile"
    Found=$(grep "$SourceLine" "$MyProfile")
    [ -n "$Found" ] && Deployed=true || Deployed=false
    echo "====check source line:<$SourceLine>, deployed:$Deployed" 1>&2
    # check whether the .vimrc.ext profile is deployed
    if ! $Deployed ; then # not-deployed
        if [ "$Action" == "deploy" ]; then
            echo "====deploy $profile" 1>&2
            echo  "$SourceLine" >> "$MyProfile"
        fi
    else                        # already-deployed
        if [ "$Action" == "undeploy" ]; then
            echo "====undeploy $profile" 1>&2
                            sed -i    "\#$SourceLine#d" "$MyProfile" 2>/dev/null; # gnu
            [ $? -ne 0 ] && sed -i '' "\#$SourceLine#d" "$MyProfile" 2>/dev/null; # mac
        fi
    fi
    echo "====$Action $profile done" 1>&2
done

