#!/bin/bash

# 遍历当前目录下的所有文件夹
for dir in */; do
    # 检查是否为目录且包含 config.yml 文件
    if [ -d "$dir" ] && [ -f "$dir/config.yml" ]; then
        # 使用 sed 命令将 listenGrpcMultiaddr 的值置为空字符串
        sed -i '' 's/\(listenGrpcMultiaddr:\).*/\1 ""/' "$dir/config.yml"
        
        # 输出修改日志
        echo "已将 $dir/config.yml 中的 listenGrpcMultiaddr 值设置为空字符串"
    fi
done

echo "所有文件夹中的 config.yml 文件已处理完成。"
