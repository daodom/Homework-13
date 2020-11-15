#!/bin/bash

echo AM/PM entered $1
echo Two digit hour entered $2
echo Four Digit date entered $3

grep $1 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule | grep $2 | grep $3| awk '{print $1, $2, $5, $6}'

