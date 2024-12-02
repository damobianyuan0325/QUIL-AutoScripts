#!/bin/bash

while true; do
  # 执行你的任务脚本
  ./merge_token.sh
  
  # 打印日志时间戳（可选）
  echo "merge_token.sh executed at $(date)"
  
  # 等待 6 小时 (21600 秒)
  sleep 21600
done
