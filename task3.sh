
#!/bin/bash

# 1.Extract passengers from 2nd class who embarked at Southampton.
# 2.Replace male/female with M/F.
# 3.Calculate average age of the filtered passengers
#!/bin/bash


awk -F',' 'BEGIN {OFS=","} $3 == 2 && $NF ~ /S/ {print $0}' titanic.csv |
sed 's/female/F/g; s/male/M/g' | 
awk -F',' 'BEGIN {OFS=","} {print $0} {if($7 != "") {sum += $7; count++}}
END {
if(count > 0) {
Avg_age =sum/count; print "Average Age : " Avg_age
} else {
print "No age found"
}
}'