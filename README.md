# m02uku-devcontainer

## How to use

1. [インストーラ(m-dev-installer.sh)](m-dev-installer.sh) をダウンロード --> 実行：

```bash
sh m-dev-installer.sh
```

2. `.gitignore` に以下を追加：

```
.devcontainer
.vscode
m02uku-devcontainer
m-dev-installer.sh
```

以上。

## 注意事項

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
