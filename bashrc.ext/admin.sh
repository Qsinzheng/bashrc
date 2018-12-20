#!/bin/bash
# script to deploy .bashrc.ext profile, by Qsinzheng at 20181214

[ $# -lt 2 -o "$1" == "-h" -o "$1" == "-h" ]  && 
    echo "usage  : $0 action    bashrc-ext-profile"   &&
    echo "example: $0 deploy   .bashrc.ext.linux"     &&
    echo "example: $0 deploy   .bashrc.ext.mac"       &&
    echo "example: $0 deploy   .bashrc.ext.dev"       &&
    echo "example: $0 undeploy .bashrc.ext.cyg"       &&
    echo "example: $0 deploy   .bashrc.ext.sec.proxy-on"  &&
    echo "example: $0 undeploy .bashrc.ext.sec.proxy-on"  &&
    echo "example: $0 deploy   .bashrc.ext.sec.proxy-off" && exit 1;
Action="$1";
shift 1;
BashRCProfile="$@";
BashRCProfileSuit=(.bashrc.ext.*);

   MyProfile=~/.bashrc
BashRCExtDir=~/.bashrc.ext
[ ! -f "$MyProfile"    ] && touch "$MyProfile"
[ ! -f "$BashRCExtDir" ] && mkdir -p "$BashRCExtDir"

# deploy the basis .bashrc.ext profile
if [ "$Action" == "deploy" ]; then
    for profile in ${BashRCProfileSuit[@]}; do
        cp -p "$profile" "$BashRCExtDir"
    done
fi

# deploy the specified .bashrc.ext profile
for profile in $BashRCProfile; do
    [ ! -f "$profile" ] && continue;
    SourceLine="source ~/.bashrc.ext/$profile"
    Found=$(grep "$SourceLine" "$MyProfile")
    [ -n "$Found" ] && Deployed=true || Deployed=false
    echo "====check source line:<$SourceLine>, deployed:$Deployed" 1>&2
    # check whether the .bashrc.ext profile is deployed
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

