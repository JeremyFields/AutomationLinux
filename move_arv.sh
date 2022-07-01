#!/bin/bash

# # # # # # # # # # # # # # # # #  automation script to  # # # # # # # # # # # # # # # # # #

# 1) rename, date, and move last week's Arv.csv file from /scripts/eos/ to oldFiles
# 2) get the newly uploaded Arv.csv from /tmp/ and copy to current directory (/scripts/eos/)
# 3) run the eosUpdateSystec python script in the background


# function to move last week's arv
function move_old_arv {
   insert_date=`date +%m%d%Y -d "7 days ago"`
   mv Arv.csv ./oldFiles/Arv.csv_$insert_date
}

# function to move the newly uploaded arv
function move_new_arv {
   cp /tmp/Arv.csv .
}

# function to run the python script
function run_py {
   nohup python3.6 eosUpdateSysrec.py &
}

# run functions
move_old_arv
move_new_arv
run_py