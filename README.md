# AWS CFT Development image
[![Docker Repository on Quay](https://quay.io/repository/slukasik/aws-cft-toolkit/status "Docker Repository on Quay")](https://quay.io/repository/slukasik/aws-cft-toolkit)

A handy container that I use for developing AWS CloudFormation resources.

### Run

```
docker run -it --rm \
    -v ~/.aws:/aws \
    quay.io/slukasik/aws-cft-toolkit
```
