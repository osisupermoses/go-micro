# ---build a tiny docker image---
    FROM alpine:latest

    RUN mkdir /app
    
    COPY frontEndApp_arm64 /app
    
    # Run
    CMD [ "/app/frontEndApp_arm64" ]