export PID=$$
export SCRIPT_NAME=`realpath $0`
RED='\033[0;31m'
END='\033[0m'

lock="/tmp/${SCRIPT_NAME//\//_}.pid"
mkdir -p $(dirname $lock)

if [[ -f "$lock" ]]; then
pid=$(cat $lock)
echo -e "$RED$ kill -9 $pid$END"
kill -9 $pid 2>/dev/null|| true
while [ -e /proc/$pid ]; do
  echo "$SCRIPT_NAME: pid $pid running , trying kill it"
  kill $pid
  sleep 1
done
fi

trap "rm -f $lock; exit $?" INT TERM EXIT
echo $PID > $lock
