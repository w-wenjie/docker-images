#! /bin/bash

if [ $# -ne 1 ]; then
 echo "Usage: $0 your_image_name"
 exit 1
fi

image=${1}
tmp_image=${image#*\/}
gen_image=${tmp_image//[\/:]/-}

echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]download registry.cn-hangzhou.aliyuncs.com/wwj_personal/image:${gen_image}"

docker pull registry.cn-hangzhou.aliyuncs.com/wwj_personal/image:${gen_image}
if [ $? -eq 0 ]; then
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]pull success"
else
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][ERROR]pull fail"
fi

docker tag registry.cn-hangzhou.aliyuncs.com/wwj_personal/image:${gen_image} ${image}
if [ $? -eq 0 ]; then
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]tag success"
else
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][ERROR]tag fail"
fi

docker rmi registry.cn-hangzhou.aliyuncs.com/wwj_personal/image:${gen_image}
if [ $? -eq 0 ]; then
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]remove success"
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][INFO]download success"
else
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][ERROR]remove fail"
 echo "[$(date '+%Y-%m-%d %H:%M:%S')][ERROR]download fail"
fi

