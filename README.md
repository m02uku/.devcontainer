# m02uku-devcontainer

## How to use

1. [インストーラ(m-dev-installer.sh)](m-dev-installer.sh) をダウンロード --> プロジェクトルートに設置 --> 実行：

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

3. 必要ならば以下のどちらかを実行する：

```
>Dev Containers: Rebuild Container
```

```
>Dev Containers: Rebuild Container Without Cache
```

以上。

## 注意事項

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
