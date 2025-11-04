FROM python:3.11-slim

# システムパッケージの更新とインストール
RUN apt-get update && apt-get install -y \
    openssh-client \
    sshpass \
    git \
    curl \
    vim \
    iputils-ping \
    telnet \
    && rm -rf /var/lib/apt/lists/*

# Pythonパッケージのインストール
RUN pip install --upgrade pip && \
    pip install \
    ansible \
    ansible-core \
    pywinrm \
    requests \
    requests-ntlm \
    requests-credssp \
    xmltodict

# Ansibleコレクションのインストール
RUN ansible-galaxy collection install \
    ansible.windows \
    community.windows \
    chocolatey.chocolatey

# 作業ディレクトリを設定
WORKDIR /workspace

# Ansibleの設定ファイルをコピー
COPY ansible.cfg /etc/ansible/ansible.cfg

# デフォルトコマンド
CMD ["/bin/bash"]