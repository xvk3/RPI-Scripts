players="$(curl -s https://steamcommunity.com/app/570940 | grep -Po -m 1 "(?<=>).*(?= In-Game)" | sed 's/,//g')"
if [ -z "$players" ]
    then
    exit 1
fi
echo "players= $players"
echo $players >> ~/trd/dsr.log
echo $players >> ~/stor/trd/dsr.log
lines=$(wc -l < ~/trd/dsr.log)
echo "lines= $lines"
remove=$((lines-168))
echo "remove= $remove"
if [ $remove -ge 1 ]
    then
    echo "removing $remove lines"
    echo "sed -i -e '1,${remove}d' ~/trd/dsr.log"
    sed -i -e 1,${remove}d ~/trd/dsr.log
fi
