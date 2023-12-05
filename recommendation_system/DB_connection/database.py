import psycopg2


class Database:
    def __init__(self, password: str, host: str = "localhost", dbname: str = "movie_mood", user: str = "postgres"):
        self.conn = psycopg2.connect(host=host, dbname=dbname, user=user, password=password, port=5432)
        self.cursor = self.conn.cursor()

    def close_cursor(self):
        self.cursor.close()

    def close_connection(self):
        self.conn.close()

