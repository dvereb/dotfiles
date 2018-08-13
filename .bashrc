function currentbranch {
	unset BN_1
	unset BN_2
	unset BN_3
	BRANCHNAME="$(git branch 2>/dev/null | grep \* | cut -d ' ' -f2 -z)"
	if [ ! -z $BRANCHNAME ]
	then
		BN_1=$'\033[38;5;74m\033[48;5;114m';
		BN_2="▓▒░";
		BN_3=$'\033[38;5;232m';
		BRANCHNAME=" ⎇  $BRANCHNAME ";
	fi
}
function musicstatus {
	# MUSIC: ▸ ⏸
	MUSICSTATUS="$(mpc status | grep "\[playing\]" | wc -l)"
	if [ $MUSICSTATUS -eq 1 ]
	then
		echo -e '⏵';
	else
		echo -e '⏸';
	fi
}
PROMPT_COMMAND=currentbranch
PS1='\[\033[38;5;232m\033[48;5;74m\]`musicstatus`\[\033[48;5;74m\] \w \[$BN_1\]$BN_2\[$BN_3\]$BRANCHNAME░▒▓\[\033[m\] ';
#PS1='░ • '
