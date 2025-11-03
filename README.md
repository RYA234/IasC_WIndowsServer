# 概要
WindowsServerをVagrant（Hyper-V）とTerraformで構築するためのリポジトリです。


名称|バージョン|説明
---|----------|----
Windows|10|クライアントのOS
VSCODE|--| IDE
Vagrant|2.2|仮想マシン構築ツール
Terraform|--|IasCツール
Ansible|--|構成管理ツール
HyperV|--||aa
WindowsServer|2019　GUI版|構築したいサーバー

# 仮想環境要件
HDD容量：５０GM
メモリ：８GB
WindowsServer2019 GUI版
リモートデスクトップ接続できること
ログイン情報は以下の通りとする。
PC名：vagrantWinServer2019
UserName: admin
password: 1P@ssw0rd

は固定値はenv.ファイルみたいなのを使って別ファイルに分けること



Ansible側
SQLServerがインストール済みであること
クライアント側からSQLServerにアクセスできること
SQLのアクセス情報は
UserName:USER
pass:test
とする


SSMSをインストールする。