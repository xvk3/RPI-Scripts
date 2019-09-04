players="$(curl -s https://steamcommunity.com/app/211420 | grep -Po -m 1 "(?<=>).*(?= In-Game)" | sed 's/,//g')"
if [ -z "$players" ]
    then
    exit 1
fi
echo "players= $players"
echo $players >> ~/trd/ptde.log
echo $players >> ~/stor/trd/ptde.log
lines=$(wc -l < ~/trd/ptde.log)
echo "lines= $lines"
remove=$((lines-168))
echo "remove= $remove"
if [ $remove -ge 1 ]
    then
    echo "removing $remove lines"
    echo "sed -i -e '1,${remove}d' ~/trd/ptde.log"
    sed -i -e 1,${remove}d ~/trd/ptde.log
fi
