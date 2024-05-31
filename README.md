# m02uku-devcontainer

## つかいかた

0. プロジェクトルートに `m02uku-devcontainer` がある場合には削除：

```bash
rm -rf m02uku-devcontainer
```

1. このリポジトリをプロジェクトルートにクローン --> プロジェクトルートからインストールファイルを実行：

```bash
git clone https://github.com/m02uku/m02uku-devcontainer.git
sh m02uku-devcontainer/m-dev-installer.sh
```

2. `.gitignore` に以下を追加：

```
# Exclude m02uku-devcontainer
.devcontainer
.vscode
m02uku-devcontainer
```

3. 必要ならば以下のどちらかを実行する：

```
>Dev Containers: Rebuild Container Without Cache
>Dev Containers: Rebuild Without Cache and Reopen in Container
```

おわりィ！

## 注意事項

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
