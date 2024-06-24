# devcontainer

## つかいかた

このリポジトリをクローン ＆ サブモジュールを初期化 ＆ Devcontainer をインストール

```bash
git submodule add https://github.com/m02uku/devcontainer.git submodules/devcontainer
sed -i 's/\r$//' submodules/devcontainer/scripts/*.sh
bash submodules/devcontainer/scripts/devcontainer.sh
```

Devcontainer に入ってから以下を実行

```bash
bash submodules/devcontainer/scripts/init.sh
```

サブモジュールを更新する場合

```bash
git submodule update --remote (<submodule path>)
```

おわりィ！

## その他

`bash submodules/devcontainer/scripts/init.sh`が実行できない場合は改行コードを変更

```bash
sed -i 's/\r$//' submodules/devcontainer/scripts/*.sh
```

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
