FROM python python:3.7-alpine
# FROM python:3.7-alpine as builder
#LABEL Manitainer="Charles" Application-name="E-comm Website"
WORKDIR /code
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
# FROM gcr.io/distroless/python3
# WORKDIR /code
# COPY --from=builder /code /code/
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
