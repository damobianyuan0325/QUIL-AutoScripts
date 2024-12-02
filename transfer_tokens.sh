#!/bin/bash
# 设置执行命令的路径，这里需要替换成最新的命令，并且需要匹配架构，例如linux-amd64或者是darwin-arm64
CMD="./qclient-2.0.2.3-darwin-arm64 token transfer"

# 设置输入和输出文件
INPUT_FILE="coins_full_output.txt"
OUTPUT_FILE="transfer_output.txt"
LOG_FILE="script_debug.log"

# 设置目标地址，这里需要将如下地址替换为接受代币转账的地址，注明是balance地址不是coins地址
TARGET_ADDRESS="0x0000000000000000000000000000000000000000000000000000000000000000"

# 删除之前的输出文件和日志文件
rm -f "$OUTPUT_FILE" "$LOG_FILE"

# 初始化日志文件
echo "脚本开始执行: $(date)" > "$LOG_FILE"

# 检查输入文件是否存在
if [ ! -f "$INPUT_FILE" ]; then
    echo "输入文件 $INPUT_FILE 不存在，脚本退出。" | tee -a "$LOG_FILE"
    exit 1
fi

# 读取 coins_full_output.txt 文件并生成转账命令
while IFS= read -r line; do
    echo "读取行: $line" >> "$LOG_FILE"

    # 提取配置路径和 Coin 地址
    if [[ $line =~ \[(.+)\] ]]; then
        CONFIG_DIR="${BASH_REMATCH[1]}"
        echo "提取到路径: $CONFIG_DIR" >> "$LOG_FILE"
    elif [[ $line =~ Coin\ ([A-Za-z0-9]+) ]]; then
        COIN_ADDRESS="${BASH_REMATCH[1]}"
        echo "提取到地址: $COIN_ADDRESS" >> "$LOG_FILE"

        # 构建转账命令
        TRANSFER_CMD="$CMD $TARGET_ADDRESS $COIN_ADDRESS --config=\"$CONFIG_DIR\""
        echo "$TRANSFER_CMD" >> "$OUTPUT_FILE"
        echo "构建的命令: $TRANSFER_CMD" >> "$LOG_FILE"
    else
        echo "未匹配的行: $line" >> "$LOG_FILE"
    fi
done < "$INPUT_FILE"

# 完成脚本执行日志
