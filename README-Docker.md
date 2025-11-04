# Ansible Docker Environment

Ansibleが動作するDocker環境です。Windows Serverの管理・設定自動化に使用できます。

## 構成

```
.
├── docker-compose.yml    # Docker Compose設定
├── Dockerfile           # Ansibleコンテナの定義
├── ansible.cfg          # Ansible設定
├── inventory/
│   └── hosts.yml       # インベントリファイル
└── playbooks/
    ├── test-connection.yml  # 接続テスト
    └── windows-setup.yml    # Windows基本設定
```

## 使用方法

### 1. Dockerコンテナの起動
```bash
docker-compose up -d
```

### 2. Ansibleコンテナに入る
```bash
docker-compose exec ansible bash
```

### 3. 接続テスト
```bash
ansible-playbook playbooks/test-connection.yml
```

### 4. Windows Server設定
```bash
ansible-playbook playbooks/windows-setup.yml
```

## インベントリの設定

`inventory/hosts.yml`でターゲットホストを設定：

- **windows-server-01**: VagrantのWindows Server VM
- **windows-target**: Dockerコンテナ（テスト用）

## プレイブック

### test-connection.yml
- Windows Server への接続確認
- 基本的なPowerShellコマンド実行

### windows-setup.yml
- ホスト名設定
- タイムゾーン設定（日本時間）
- Windows Update実行
- IISインストール
- Chocolatey + 基本ソフトウェアインストール

## WinRM設定

Windows側でWinRMを有効化する必要があります：

```powershell
# WinRM有効化
Enable-PSRemoting -Force
winrm quickconfig -force

# Basic認証を許可
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}
```

## トラブルシューティング

### 接続エラーの場合
1. Windows側のWinRM設定を確認
2. ファイアウォール設定を確認
3. 認証情報を確認

### コンテナの再ビルド
```bash
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```