FROM python:3.11-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    openssh-client \
    sshpass \
    git \
    curl \
    wget \
    vim \
    gnupg \
    unzip \
    jq \
    lsb-release \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Ansibleとその他必要なパッケージをインストール
RUN pip install --no-cache-dir \
    ansible \
    pywinrm[credssp] \
    requests \
    requests-credssp \
    awscli \
    azure-cli

# Terraformのインストール
RUN wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && apt-get install -y terraform && \
    rm -rf /var/lib/apt/lists/*

# tflintのインストール
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

# terragruntのインストール
RUN wget -O /usr/local/bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_amd64 && \
    chmod +x /usr/local/bin/terragrunt

# 作業ディレクトリを設定
WORKDIR /workspace

# バージョン確認用スクリプト
RUN echo '#!/bin/bash\n\
echo "=== IaC Tools Versions ==="\n\
echo "Ansible: $(ansible --version | head -n1)"\n\
echo "Terraform: $(terraform version | head -n1)"\n\
echo "AWS CLI: $(aws --version)"\n\
echo "Azure CLI: $(az version -o tsv 2>/dev/null | head -n1)"\n\
echo "tflint: $(tflint --version)"\n\
echo "terragrunt: $(terragrunt --version)"\n\
echo "=========================="' > /usr/local/bin/versions && \
    chmod +x /usr/local/bin/versions

# デフォルトコマンド
CMD ["bash"]