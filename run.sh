#!/bin/bash

for i in 10 20 30 40 50 60 70 80 90 100;do
./main.x $i | awk '{print $2}' >> file_node$i.dat
done
