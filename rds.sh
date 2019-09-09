active=$(curl -A "xvk3-scraper" -s "https://www.reddit.com/r/darksouls" | grep -Po -m1 "(?<=\"_3XFx6CfPlg-4Usgxm0gK8R\"\>)\d+.?(?=</p>)" | tail -1)
if [ -z "$active" ]
    then
    active=0
fi
echo $active
echo $active >> ~/trd/rds.log
echo $active >> ~/stor/trd/rds.log
lines=$(wc -l < ~/trd/rds.log)
echo "lines= $lines"
remove=$((lines-168))
echo "remove= $remove"
if [ $remove -ge 1 ]
    then
    echo "removing $remove lines"
    echo "sed -i -e '1,$(remove)d' ~/trd/rds.log"
    sed -i -e '1,$(remove)d' ~/trd/rds.log
fi
