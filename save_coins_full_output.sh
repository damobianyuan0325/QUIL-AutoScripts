#!/bin/bash

# 设置命令路径 这里需要替换成最新的命令，并且需要匹配架构，例如linux-amd64或者是darwin-arm64
CMD="./qclient-2.0.2.3-darwin-arm64 token coins"

# 设置包含配置子目录的主目录
MAIN_DIR="/quil"  # 修改为你的主目录路径，将本命令放在/quil这个目录下执行

# 输出文件路径
OUTPUT_FILE="coins_full_output.txt"

# 删除之前的输出文件
rm -f "$OUTPUT_FILE"

# 初始化总和变量
total_quil=0

# 遍历主目录下的所有子目录
for CONFIG_DIR in "$MAIN_DIR"/*/; do
    # 检查是否为目录
    if [ -d "$CONFIG_DIR" ]; then
        # 执行命令并获取完整输出
        OUTPUT=$($CMD --config="$CONFIG_DIR")
        
        # 将完整输出写入文件，带上时间戳和目录名称
        echo "$(date): [$CONFIG_DIR] $OUTPUT" >> "$OUTPUT_FILE"

        # 打印日志，方便查看进度
        echo "$(date): 已从 $CONFIG_DIR 写入完整输出到 $OUTPUT_FILE"

        # 提取行首为数字且包含 "QUIL" 的值并累加
        while read -r line; do
            if [[ $line =~ ^([0-9]+\.[0-9]+)\ QUIL ]]; then
                total_quil=$(echo "$total_quil + ${BASH_REMATCH[1]}" | bc)
            fi
        done <<< "$OUTPUT"
    fi
done

# 打印 QUIL 总和
echo "QUIL 总和: $total_quil"
echo "QUIL 总和: $total_quil" >> "$OUTPUT_FILE"

# 执行完所有操作后打印提示信息
echo "所有配置目录的完整输出已成功写入 $OUTPUT_FILE，并已计算 QUIL 总和。"
