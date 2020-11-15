#!/bin/bash

echo Specified AM/PM $1
echo Specified two digit hour $2
echo Specified four digit date $3
echo Which game?
read game


if  [ "$game" = "Black" ]
then

grep $1 *_Dealer_schedule | grep $2 | grep $3| awk '{print $1, $2, $3, $4}'

else

  if  [ "$game" = "Roulette" ]
   then
   grep $1 *_Dealer_schedule | grep $2 | grep $3| awk '{print $1, $2, $5, $6}'
  else

    if [ "$game" = "Texas" ]
     then
       grep $1 *_Dealer_schedule | grep $2 | grep $3 | awk '{print $1, $2, $7, $8}'
   else
         grep $1 *Dealer_schedule | grep $2 | grep $3 | awk '{print $1, $2, $3, $4, $5, $6, $7, $8}'
    fi
  fi
fi

