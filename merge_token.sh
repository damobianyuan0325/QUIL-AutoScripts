#!/bin/bash

# 定义工作目录和命令
WORK_DIR="~/ceremonyclient/node/"
# config=接收地址的配置文件路径，这个记得改
COMMAND="./qclient-2.0.4.1-linux-amd64 token coins --config=/QUIL/config/"
# 设置命令路径 这里需要替换成最新的命令，并且需要匹配架构，例如linux-amd64或者是darwin-arm64
MERGE_COMMAND="./qclient-2.0.4.1-linux-amd64token merge"
# 接收地址的配置文件路径
CONFIG_PATH="/QUIL/config/"

# 切换到工作目录
cd "$WORK_DIR" || { echo "Failed to change directory to $WORK_DIR"; exit 1; }

# 运行命令并捕获输出
output=$($COMMAND)

# 使用 grep 和 awk 提取地址
addresses=($(echo "$output" | grep -o '0x[0-9a-fA-F]\{64\}'))

# 检查是否提取到地址
if [ ${#addresses[@]} -eq 0 ]; then
  echo "No addresses found."
  exit 1
fi

# 打印提取到的地址（可选）
echo "Extracted addresses:"
for address in "${addresses[@]}"; do
  echo "$address"
done

# 将地址格式化为所需的命令行参数
formatted_addresses=$(printf " %s" "${addresses[@]}")
formatted_addresses=${formatted_addresses:1}  # 去掉开头的空格

# 执行合并命令，添加等号和双引号
$MERGE_COMMAND $formatted_addresses --config="$CONFIG_PATH"

# 打印合并结果
echo "Merge command executed with addresses: $formatted_addresses"
