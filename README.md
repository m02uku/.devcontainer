# devcontainer

## つかいかた

0. プロジェクトルートに `devcontainer` がある場合には削除：

```bash
rm -rf devcontainer
```

1. このリポジトリをプロジェクトルートにクローン --> プロジェクトルートからインストールファイルを実行：

```bash
git clone https://github.com/m02uku/devcontainer.git
sh devcontainer/install.sh
```

2. `.gitignore` に以下を追加：

```
# Exclude devcontainer
.devcontainer
.vscode
devcontainer
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
