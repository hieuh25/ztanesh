#!/usr/bin/env zsh

export GLOBALRC=~/.zsh/rc
export ALLRCS=$GLOBALRC/../lib/ztanesh-rcs.new
export ALLRCS_TO=$GLOBALRC/../lib/ztanesh-rcs.zsh

zsh -c '
	echo "# WARNING: This file is AUTOGENERATED - do not hand edit" > $ALLRCS

	startfiles=$(\ls -1 $GLOBALRC/* | xargs -n 1 basename | sort | uniq)

	for i in `echo $startfiles`
	do
		cat $GLOBALRC/$i >> $ALLRCS
	done
'

if zcompile $ALLRCS
then
    mv -f $ALLRCS     $ALLRCS_TO
    mv -f $ALLRCS.zwc $ALLRCS_TO.zwc
else
    echo "Some errors when compiling, pls fix!"
fi
