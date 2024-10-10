
#!/bin/bash

# 1.Extract passengers from 2nd class who embarked at Southampton.
# 2.Replace male/female with M/F.
# 3.Calculate average age of the filtered passengers
gawk -F, '
    NR > 1 && $3 == 2 && $12 == 'S' {
        sex = ($6 == "male") ? "M" : "F";
        age = $7;
        if (age != "") {
            sum += age; 
            count++;
        }
    } 
    END {
        if (count > 0) {
            avg = sum / count;  
            print "Average age: " avg; 
        } else {
            print "Age Unavailable!"
        }
    }
' titanic.csv