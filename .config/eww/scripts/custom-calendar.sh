YEAR=$(date +%Y)
MONTH=$(date +%m)
TODAY=$(date +%d)

MONTH_NAME=$(date +%B)

# Change to %w for Sunday=0
FIRST_DAY=$(date -d "$YEAR-$MONTH-01" +%w)
DAYS_IN_MONTH=$(date -d "$YEAR-$MONTH-01 +1 month -1 day" +%d)

echo '(box :orientation "vertical" :class "calendar-container"'

echo '  (box :orientation "vertical" :class "calendar-grid"'

echo "  (label :class \"calendar-title\" :text \"$MONTH_NAME $YEAR\")"

echo '  (box :orientation "horizontal" :class "weekdays"'
for day in Sun Mon Tue Wed Thu Fri Sat; do
    echo "    (label :text \"$day\" :class \"weekday\")"
done
echo '  )'

COUNT=1
ROW="    (box :orientation \"horizontal\" :space-evenly true"

# Adjusted loop start for FIRST_DAY where Sunday=0
for ((i=0; i<FIRST_DAY; i++)); do
    ROW="$ROW (label :text \" \")"
    COUNT=$((COUNT + 1))
done

for ((d=1; d<=DAYS_IN_MONTH; d++)); do
    TEXT=$(printf "%2d" $d)
    CLASS="day"
    [[ "$d" -eq "$TODAY" ]] && CLASS="day today"
    ROW="$ROW (label :text \"$TEXT\" :class \"$CLASS\")"

    if (( COUNT % 7 == 0 )); then
        echo "$ROW)"
        ROW="    (box :orientation \"horizontal\" :space-evenly true"
    fi
    COUNT=$((COUNT + 1))
done

REMAINING=$(( (COUNT - 1) % 7 ))
if (( REMAINING != 0 )); then
    for ((i=REMAINING; i<7; i++)); do
        ROW="$ROW (label :text \" \")"
    done
    echo "$ROW)"
fi

echo '  )'
echo ')'

