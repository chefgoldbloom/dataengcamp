FROM python:latest

RUN python -m pip install pandas sqlalchemy psycopg2 pyarrow

WORKDIR /app

COPY upload-data.py upload-data.py

ENTRYPOINT [ "python","upload-data.py" ]
