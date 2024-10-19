# ---build a tiny docker image---
FROM alpine:latest

RUN mkdir /app

COPY brokerApp_arm64 /app

# Run
CMD [ "/app/brokerApp_arm64" ]