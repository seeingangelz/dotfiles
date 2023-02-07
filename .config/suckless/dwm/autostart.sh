#/bin/bash

dte(){
	dte="$(date +"%a %d/%m |  %H:%M")"
	echo -e " $dte"
}

upd(){
	upd=`checkupdates | wc -l`
	echo -e " $upd"
}

bat(){
    acpi=`acpi -b`
    if echo $acpi | grep -q "Charging"; then
        bat=`echo $acpi | awk '{print $4}' | sed s/,//`
        echo -e " $bat"
    else
        bat=`echo $acpi | awk '{print $4}' | sed s/,//`
        charge=`echo $bat | sed -e 's/%//g'`
        if [ $charge -gt 75 ]; then
            echo -e " $bat"
        elif [ $charge -gt 50 ]; then
            echo -e " $bat"
        elif [ $charge -gt 25 ]; then
            echo -e " $bat"
        else
            echo -e " $bat"
        fi
    fi
}

wtr(){
    wtr=`curl -s "wttr.in/?format=3" | grep -o -E '[0-9]+°C'`
    echo -e "󰀸 $wtr"
}

bri(){
    bri=`xbacklight -get`
    echo -e " $bri%"
}

vol(){
    status=$(pulsemixer --get-mute)
    if [ $status == "1" ]; then
        echo -e "婢"
    else
        vol=$(pulsemixer --get-volume | awk '{print ($1+$2)/2}')
        if [ $(echo "$vol >= 1 && $vol <= 49" | bc) -eq 1 ]; then
            echo -e "奔 $vol%"
        else
            if [ $(echo "$vol == 0" | bc) -eq 1 ]; then
                echo -e "ﱝ"
            else
                echo -e "墳 $vol%"
            fi
        fi
    fi
}


song(){
    if pgrep -x "cmus" > /dev/null
    then
        output=$(cmus-remote -Q)
        artist=$(echo "$output" | awk '/artist/ { if (found != 1) { found=1; for (i=3; i<=NF; i++) { printf "%s ", $i } } }')
        title=$(echo "$output" | awk '/title/ { for (i=3; i<=NF; i++) { printf "%s ", $i } }')
        if [ -z "$artist" ] && [ -z "$title" ]; then
            echo " Track not found "
        else
            echo -e " $artist- $title"
        fi
    else
        echo " Track not found"
    fi
}

net(){
  if ping -c 1 "9.9.9.9" > /dev/null; then
    echo -e "直"
  else
    echo -e "睊"
  fi
}

mem(){
    mem=`free | awk '/Mem/ {printf "%.2f/%.2f GB\n", $3 / 1024 / 1024, $2 / 1024 / 1024 }'`
    echo -e " $mem"
}

hdd(){
	hdd=`df -h --output=used,pcent / | awk 'NR==2{print $1" "$2}'`
	echo -e " $hdd"
}

cpu(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo -e " $cpu%"
}

temp(){
    output=$(sensors)
    echo "$output" | while read line
    do
        if echo "$line" | grep -q "Core"; then
            temp=$(echo "$line" | awk '{print $3}' | tr -d '+°C' | cut -c1-2)
            echo "$tempºC"
            break
        fi
    done
}

xkb(){
  layout=$(setxkbmap -query | awk '/layout/{print $2}')
  echo " $layout"
}

while true; do
    if pgrep -x "cmus" > /dev/null; then
        song=$(song)
        dwm -s "$song| $(cpu) $(temp) | $(hdd) | $(mem) | $(upd) | $(vol) | $(bat) | $(dte) | $(net) "
    else
      dwm -s "$(cpu) $(temp) | $(hdd) | $(mem) | $(upd) | $(vol) | $(bat) | $(dte) | $(net) "
    fi
    sleep 1s
done &
