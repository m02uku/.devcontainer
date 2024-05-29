# m02uku-devcontainer

## How to use

1. プロジェクトルート内にクローンし、`install.sh` を実行：

```bash
git clone https://github.com/m02uku/m02uku-devcontainer.git && sh m02uku-devcontainer/install.sh
```

2. `.gitignore` に以下を追加：

```
.devcontainer
.vscode
m02uku-devcontainer
```

以上。

## 注意事項

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
