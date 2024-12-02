#!/bin/bash

# 下载 QUIL 项目相关的执行脚本
echo "Downloading QUIL automation scripts..."
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/save_balance_loop.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/save_coins_full_output.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/execute_transfer_commands.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/merge_token.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/merge_runner.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/transfer_tokens.sh
wget https://raw.githubusercontent.com/damobianyuan0325/QUIL-AutoScripts/main/configure_node.sh

# 下载 QUIL 相关的库文件
echo "Downloading QUIL library files..."
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.1
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.2
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.4
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.7
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.13
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.15
wget https://releases.quilibrium.com/qclient-2.0.4.1-linux-amd64.dgst.sig.16

# 确保脚本文件具有执行权限
echo "Setting execute permissions for scripts..."
chmod +x save_balance_loop.sh save_coins_full_output.sh execute_transfer_commands.sh merge_token.sh merge_runner.sh transfer_tokens.sh configure_node.sh

echo "All QUIL files downloaded successfully and scripts are now executable."