source
======
This repository is a collections of build scripts for the generation of Slackware packages; which 
may or may not be provided by Slackware or SBo.

Only build scripts in dissociate should be considered stable.
Every, and all other scripts related to unity are in pre(pre-alpha) development.

For testers:
	Assuming your current working directory is the location of this repository.

	Step 1 - resolve all sources (md5sum is being ignored):

for set in $(grep : BuildOrder) ; do set_clean=$(echo $set | rev | cut -c 2- | rev) ; for prgname in $(cat BuildOrder) ; 
do if [ "$prgname" == "--" ] ; then read_line=0 ; fi ; if [ "$read_line" == "1" ] ; then (cd $set_clean/$prgname && declare -a src ; 
src=$(. $prgname.info && echo $DOWNLOAD | sed "s|\\\|\\\n|g" ) ; echo -e $src | while read file ; do wget $file ; done ; unset src) ; 
fi ; if [ "$set" == "$prgname" ]; then read_line=1 ; fi ; done ; read_line=0 ; done

	Step 2 - build and install packages (all packages that 
        currently exist on the system should be safley upgraded 
	and a list of replaced packages will be produced):

for set in $(grep : BuildOrder) ; do read_line=0 ; set_clean=$(echo $set | rev | cut -c 2- | rev) ; for prgname in $(cat BuildOrder) ; 
do if [ "$prgname" == "--" ] ; then read_line=0 ; fi ; if [ "$read_line" == "1" ] ; then (cd $set_clean/$prgname ;
(sh $prgname.SlackBuild || (echo "Failed building $buffer" >> error.out && kill -INT $$)) ; if [ -z "$(ls ${OUTPUT:-/tmp}/$prgname*uSB.t?z)" -a 
-n "$(ls /tmp/$prgname*uSB.t?z)" ] ; then mv /tmp/$prgname*uSB.t?z ${OUTPUT:-/tmp}/ ; elif [ -z "$(ls ${OUTPUT:-/tmp}/$prgname*uSB.t?z)" -a 
-z "$(ls /tmp/$prgname*uSB.t?z)" ] ; then echo "Failed finding packaged $buffer" >> error.out && kill -INT $$ ; fi ; if [ -n "$(upgradepkg --reinstall 
--install-new ${OUTPUT:-/tmp}/$prgname*uSB.t?z | tee >(grep 'Upgrading'))" ] ; then echo $prgname > replaced.txt ; fi) ; 
fi ; if [ "$set" == "$prgname" ]; then read_line=1 ; fi ; done ; done

	Step 3 - clean up (if any packages were replaced the 
	information heir corresponding file names will be listed 
	in this file)

cat */*/replaced.txt > ./replaced_pacakges_list.txt
cat */*/error.out > ./errors.out
