# cat outputs/cit-switchboard-ci-258.plan|grep -oE '\$[0-9]+\.[0-9]+\/mo -\$?([0-9]+\.[0-9]+)?'

for plan in $(ls outputs);do
 cat outputs/$plan|grep -oE '\$[0-9]+\.[0-9]+\/mo -\$?([0-9]+\.[0-9]+)?' >> cost.csv
done

cat cost.csv  | sed 's/ /,/g' 

