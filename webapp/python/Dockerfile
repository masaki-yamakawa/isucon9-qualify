FROM python:3.6
ENV PYTHONUNBUFFERED 1
RUN apt-get update \
 && apt-get install -y \
    mariadb-client \
    locales locales-all
RUN locale-gen ja_JP.UTF-8
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/
ENTRYPOINT ["gunicorn", "app:app"]
CMD ["-w", "10", "-b", "0.0.0.0:8000"]
