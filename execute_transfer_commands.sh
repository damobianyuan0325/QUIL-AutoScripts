#!/bin/bash

# 日志文件路径
LOG_FILE="transfer_output.txt"
EXECUTION_LOG="execution_output.log"

# 清空之前的执行日志文件
rm -f "$EXECUTION_LOG"
echo "Transfer Execution Log" > "$EXECUTION_LOG"
echo "=========================" >> "$EXECUTION_LOG"

# 从日志文件中逐行读取并执行命令
while IFS= read -r command; do
    # 打印正在执行的命令
    echo "Executing: $command" | tee -a "$EXECUTION_LOG"

    # 执行命令并记录结果
    eval "$command" >> "$EXECUTION_LOG" 2>&1

    # 等待 5 秒
    echo "等待 5 秒..." | tee -a "$EXECUTION_LOG"
    sleep 5
done < "$LOG_FILE"

echo "所有转账命令已执行完毕，详情请查看 $EXECUTION_LOG。"
