# ---build a tiny docker image---
    FROM alpine:latest

    RUN mkdir /app
    
    COPY listenerApp /app
    
    # Run
    CMD [ "/app/listenerApp" ]