# 引数がある場合に pyenv を使用して Python のバージョンをインストールする
if [ ! -z "$1" ]; then
  pyenv install $1
  pyenv local $1
  # CODON_PYTHON 環境変数にパスを設定
  # バージョン番号を変数に格納
  version=$1

  # 追加する行を定義
  export_line="export CODON_PYTHON=\"/root/.pyenv/versions/${version}/lib/libpython3.so\""

  # .bashrcに既に存在するか確認
  if ! grep -qF -- "$export_line" ~/.bashrc; then
    # 存在しない場合、行を追加
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

source .venv/bin/activate

# Pip
pip install --upgrade pip

if [ -f requirements.txt ]; then
  pip install -r requirements.txt
else
  echo "No requirements.txt file found"
fi

echo "**Python environment created!**"
echo "Run below to activate the virtual environment:"
echo "source .venv/bin/activate"
