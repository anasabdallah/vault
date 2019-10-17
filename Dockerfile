FROM alpine

WORKDIR /app

RUN wget https://releases.hashicorp.com/vault/1.2.3/vault_1.2.3_linux_amd64.zip && unzip vault_1.2.3_linux_amd64.zip

RUN mv vault /usr/local/bin && rm -rf vault_1.2.3_linux_amd64.zip

ENV VAULT_ADDR=http://127.0.0.1:8200

ADD ./config.hcl ./

CMD ["vault", "server", "-config=config.hcl"]