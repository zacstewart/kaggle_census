#/usr/bin/env sh
# Some sed to clean up this shitty data

sed -e "
  s/\$(.*)/$(echo \1 | sed -e "s/,//;")/g;
  " data/training_filev1.csv > data/training_filev1.clean.csv
sed -e "
  s/District of Co/District of Colu/;
  " data/test_filev1.csv > data/test_filev1.clean.csv
