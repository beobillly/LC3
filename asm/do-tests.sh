#!/bin/sh

###
### Test that logisim variable is defined
###
isdef_logisim() {
  $logisim -help 2>&1 | grep options > /dev/null
  if [ "$?" = "0" ]; then
    echo "logisim: ok"
  else
    echo "logisim: please define environement variable logisim"
    echo "export logisim=\"java -jar <path to logisim.jar>\""
    exit
  fi
}

### 
### State of shell script
###
# - number of tests executed
nbTest=0
# - number of tests executed by category
lNbTest=0
# - score
score=0
# - score by category
lScore=0
# - circuit file
lc3circ=$2
# - student name
user=$1
# - category
dirs=$3

###
### Compute the score of the test
### Pre-condition: $1.ref exists!
###
test_res() {
  nbTest=$(( $nbTest + 1 ))
  lNbTest=$(( $lNbTest + 1 ))
  dname=`dirname $1`
  fname=`basename $1 .mem`
  diff $dname/$fname.out $dname/$fname.ref
  if [ "$?" = "0" ]; then
      score=$(( $score + 1 ))
      lScore=$(( $lScore + 1 ))
      echo "OK" 
  else
      echo "Erreur"
      echo -n " - expected: "
      cat $dname/$fname.ref
      echo -n " - found: "
      cat $dname/$fname.out
  fi
}

###
### Execute test
### Pre-condition:	$1 exists
### Post-condition: 	store result in $1.out
###
exec_test() {
    dname=`dirname $1`
    fname=`basename $1 .mem`
    x=$($logisim $lc3circ -load -tty $1 table | sed -n '$ p' | tr "\t " "::" | cut -d':' -f28,29,30,31)
    echo "$x" > $dname/$fname.out
}

exec_dir() {
  lNbTest=0
  lScore=0
  for i in $(ls $1/*.mem); do
    echo "==== $i "
    exec_test $i
    test_res $i
  done
  echo "score partiel: $lScore / $lNbTest"
}
  
###########################################
### Main
###########################################

isdef_logisim

if ! [ -z "$dirs" ]; then
  ### Execute only tests in $dirs
  echo " "
  echo "Tests du repertoire $dirs: "
  exec_dir $dirs
  exit
fi

###
### Execute all tests 
###
echo " "
echo "Test strlength sur la chaine \"Hello world\" "
exec_dir "."



###
### Print score
### 
echo "========================== "
echo "$user note $score / $nbTest"  >&2
