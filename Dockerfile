FROM alpine:latest

LABEL maintainer="Tristan Morgan <tristan@vibrato.com.au>"
LABEL Description="AWS-CLI in a minimal container"

ARG AWS_CLI_VERSION=1.14.42
RUN apk add --no-cache python3 groff \
 && python3 -m pip install --upgrade pip \
 && python3 -m pip install awscli==$AWS_CLI_VERSION awsprocesscreds

ENV PAGER=more
WORKDIR /work
ENTRYPOINT ["aws"]

# docker build --pull --build-arg AWS_CLI_VERSION=$AWS_CLI_VERSION -t awscli:latest -t awscli:$AWS_CLI_VERSION .
# alias aws='docker run --rm -v $(pwd):/work -v ${HOME}/.aws/:/root/.aws/ -e AWS_DEFAULT_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN awscli'
# complete -C 'docker run --rm --entrypoint /usr/bin/aws_completer -e COMP_LINE -e COMP_POINT awscli' aws
