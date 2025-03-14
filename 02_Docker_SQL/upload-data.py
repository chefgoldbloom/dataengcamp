import pandas as pd
from sqlalchemy import create_engine
import argparse
import os

def main(params):
    user = params.user
    pw = params.password
    host = params.host
    port = params.port
    db_name = params.database_name
    table = params.table_name
    url = params.url
    csv_name = 'output.parquet'

    os.system(f'wget {url} -O {csv_name}')
    df = pd.read_parquet(csv_name)
    engine = create_engine(f'postgresql://{user}:{pw}@{host}:{port}/{db_name}')
    df.to_sql(f'{table}',con=engine,index=False,chunksize=100000,if_exists='append')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Ingest CSV data to Postgres")

    # user, password, host, port, database name, table name, url of csv

    parser.add_argument('--user', help='user name for postgres')
    parser.add_argument('--password', help='password name for postgres')
    parser.add_argument('--host', help='hostname for postgres')
    parser.add_argument('--port', help='port number for postgres')
    parser.add_argument('--database_name', help='database name for postgres')
    parser.add_argument('--table_name', help='table name for postgres')
    parser.add_argument('--url', help='url for csv data')

    args = parser.parse_args()
    main(args)
