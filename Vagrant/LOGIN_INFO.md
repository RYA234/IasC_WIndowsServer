# Windows Server 2022 ログイン情報

## デフォルトログイン（Vagrant標準）
- **ユーザー名**: vagrant
- **パスワード**: vagrant

## リモートデスクトップ接続
- **IPアドレス**: 192.168.1.100 または Vagrant自動割当IP
- **ポート**: 3389（デフォルト）
- **接続方法**: 
  1. Windowsの「リモートデスクトップ接続」を起動
  2. コンピューター名に IPアドレス を入力
  3. 上記のログイン情報を使用



## VM管理コマンド
```powershell
# VM状態確認
vagrant status

# VM停止
vagrant halt

# VM再起動  
vagrant reload

# VM削除
vagrant destroy
```

## 接続確認手順
1. 管理者権限でPowerShellを起動
2. `cd 〇〇\IasC_WIndowsServer\Vagrant`
3. `vagrant up --provider=hyperv`
4. 起動完了後、`vagrant ssh` または RDP接続

