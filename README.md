# devcontainer

## つかいかた

このリポジトリをクローン ＆ サブモジュールを初期化 ＆ Devcontainer をインストール

```bash
git submodule add https://github.com/m02uku/devcontainer.git submodules/devcontainer
sed -i '' 's/\r$//' submodules/devcontainer/scripts/*.sh
chmod +x submodules/devcontainer/scripts/*.sh
bash submodules/devcontainer/scripts/init.sh --dev
```

すでにサブモジュールを追加済みのリポジトリをクローンした場合，`git submodule add` の代わりに以下でサブモジュールを初期化

```bash
git submodule update --init --recursive
```

なお，そもそも以下でクローンすると楽

```bash
git clone --recursive {gitリポジトリurl}
```

Devcontainer に入ってから，必要に応じて以下を実行

```bash
# Devcontainer を再インストール（内容を変更した際など）
bash submodules/devcontainer/scripts/init.sh --dev
# src ディレクトリを作成
bash submodules/devcontainer/scripts/init.sh --src
# Python 仮想環境を構築
bash submodules/devcontainer/scripts/init.sh --py
# サブモジュールの依存関係を初期化
bash submodules/devcontainer/scripts/init.sh --mod
# 全てを実行
bash submodules/devcontainer/scripts/init.sh --all
```

おわりィ！

## その他

`bash submodules/devcontainer/scripts/init.sh`が実行できない場合は改行コードを変更

```bash
sed -i '' 's/\r$//' submodules/devcontainer/scripts/*.sh
```

`Markdown Preview Enhanced` で CSS を編集する場合には，`Global`ではなく`Workspace`の CSS を編集する。

container 内で開発サーバをたてる場合には

```bash
npm run dev -- --host
```

で `localhost` にアクセス（？要検証）
