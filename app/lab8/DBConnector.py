import psycopg2
import os

# SOLUTIONS


class DBConnector:

    def __init__(self):
        self.conn = None
        self.cursor = None

    def set_dbconn(self, conn):
        self.conn = conn

    def connect_to_db(self):
        # establishing the connection.
        pg_dsn = os.getenv("LAB8_DATABASE_URL")
        self.conn = psycopg2.connect(pg_dsn)
        if self.conn is None:
            print('conn is null')

    def get_claim(self, doc, patient):
        # query composed by concatenation of strings and user input.
        # (comment this line out if you are executing a prepared statement).
        # query = "SELECT * FROM claims WHERE doc = '" + \
        #    doc + "' and patient='" + patient + "';"

        # TODO1: Write a prepared statement for this query:
        query = "SELECT * FROM claims WHERE doc = (%s) and patient=(%s)"
        data = (doc, patient)

        result = []
        try:
            # execute the query- first get a cursor object.
            self.cursor = self.conn.cursor()
            # now execute the query. (comment this line out if you are executing a prepared statement).
            # self.cursor.execute(query)
            # TODO2: Write a statement to execute the query using a prepared statement:
            self.cursor.execute(query, data)

            self.conn.commit()
            result.append(self.cursor.fetchall())

        except psycopg2.Error as e:
            msg_tpl = ('Your search did not succeed, try again.', ' ')
            result.append(msg_tpl)
            result.append(e.pgerror)
        return result

    def get_patient_record(self, fname, lname):
        # query composed by concatenation of strings and user input:
        # (comment this line out if you are executing a prepared statement).
        # query = "SELECT * FROM patient where fname= '" + \
        #    fname + "' and lname='" + lname + "';"

        # TODO3: Write a prepared statement for this query:
        query = "SELECT * FROM patient WHERE fname = (%s) and lname=(%s)"
        data = (fname, lname)

        result = []
        try:
            # execute the query- first get a cursor object.
            self.cursor = self.conn.cursor()

            # now execute the query. (comment this line out if you are executing a prepared statement).
            # self.cursor.execute(query)
            # TODO4: Write a statement to execute the query using a prepared statement:
            self.cursor.execute(query, data)

            self.conn.commit()
            result.append(self.cursor.fetchall())

        except psycopg2.Error as e:
            msg_tpl = ('Your search did not succeed, try again.', ' ')
            result.append(msg_tpl)
            msg_tpl = ('conn', e.pgerror)
            result.append(msg_tpl)
        return result

    # Closing the connection
    def close_db(self):
        self.conn.close()
