FROM alpine:latest

RUN mkdir /app

COPY authApp /app

# Run
CMD [ "/app/authApp" ]