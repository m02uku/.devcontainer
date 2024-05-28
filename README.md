# m02uku-devcontainer

## How to use
0. すでに `.devcontainer` や `.vscode` がある場合：
```bash
rm -rf .devcontainer && rm -rf .vscode
```
1. プロジェクトルート内にクローンし、`install.sh` を実行：
```bash
git clone https://github.com/m02uku/m02uku-devcontainer.git
```
```bash
sh m02uku-devcontainer/install.sh
```

以上。

## 注意事項
container内で開発サーバをたてる場合には
```bash
npm run dev -- --host
```
で `localhost` にアクセス（？要検証）
