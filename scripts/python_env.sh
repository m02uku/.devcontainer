# 引数がある場合に pyenv を使用して Python のバージョンをインストールする
if [ ! -z "$1" ]; then
  pyenv install $1
  pyenv local $1
  # CODON_PYTHON 環境変数にパスを設定
  # バージョン番号を変数に格納
  version=$1

  # 追加する行を定義
  export_line="export CODON_PYTHON=\"/root/.pyenv/versions/${version}/lib/libpython3.so\""

  # .bashrcに既に `CODON_PYTHON` が存在するか確認
  if ! grep -qF -- "$export_line" ~/.bashrc; then
    # 存在しない場合、追記
    echo "$export_line" >> ~/.bashrc
    echo ".bashrcにCODON_PYTHONを追加しました。"
  else
    echo "CODON_PYTHONは既に.bashrcに存在します。"
  fi
fi
# .bashrcの変更を適用
source ~/.bashrc

# Create a virtual environment
python3 -m venv .venv

# 仮想環境をアクティベート
source .venv/bin/activate
echo 仮想環境に入りました

# Pipを最新に更新
pip install --upgrade pip

# requirements.txt が存在する場合は依存関係をインストール
if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  echo "No requirements.txt file found"
fi

echo "**Python environment created!**"
echo "Run below to activate the virtual environment:"
echo "source .venv/bin/activate"
