#!/bin/bash

for one_image in $(cat images_list)
 do
  echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]>>> ${one_image} start <<<"
  sh commit.sh ${one_image}
  echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]>>> ${one_image} end <<<"
 done

