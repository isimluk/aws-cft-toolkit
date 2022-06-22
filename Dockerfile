FROM debian:latest as builder

RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*


RUN curl --silent --location https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip > sam.zip && \
    unzip sam.zip -d /sam-installation && \
    rm sam.zip

RUN /sam-installation/install

FROM debian:latest

COPY --from=builder /usr/local /usr/local

RUN apt-get update && apt-get install python3-pip -y

RUN pip install cloudformation-cli cloudformation-cli-python-plugin

RUN useradd --create-home --home-dir /aws/ awsuser
USER awsuser
WORKDIR /aws