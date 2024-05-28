# m02uku-devcontainer

## How to use
0. すでに `.devcontainer` や `.vscode` がある場合：
```bash
rm -rf .devcontainer && rm -rf .vscode
```
2. プロジェクト内にクローンする
1. プロジェクトルートから次のコマンドを実行：
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
