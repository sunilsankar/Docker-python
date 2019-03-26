FROM python:3.4-alpine3.8
MAINTAINER Sunil Sankar "nagioskeeper@gmail.com "
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]