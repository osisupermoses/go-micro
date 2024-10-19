# ---build a tiny docker image---
    FROM alpine:latest

    RUN mkdir /app
    
    COPY loggerServiceApp /app
    
    # Run
    CMD [ "/app/loggerServiceApp" ]