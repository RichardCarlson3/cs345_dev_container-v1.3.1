import psycopg2
from psycopg2 import extensions
import time
import os


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

    def get_claim(self, doc, patient):
        # query composed by concatenation of strings and user input.
        # (comment this line out if you are executing a prepared statement).
        query = "SELECT * FROM claims WHERE doc = '" + \
            doc + "' and patient='" + patient + "';"

        result = []
        try:
            # execute the query- first get a cursor object.
            self.cursor = self.conn.cursor()
            # now execute the query. (comment this line out if you are executing a prepared statement).
            self.cursor.execute(query)

            self.conn.commit()
            result.append(self.cursor.fetchall())

        except psycopg2.Error as e:
            msg_tpl = ('Your search did not succeed, try again.', ' ')
            result.append(msg_tpl)
        return result

    def get_patient_record(self, fname, lname):
        # query composed by concatenation of strings and user input:
        # (comment this line out if you are executing a prepared statement).
        query = "SELECT * FROM patient where fname= '" + \
            fname + "' and lname='" + lname + "';"

        result = []
        try:
            # execute the query- first get a cursor object.
            self.cursor = self.conn.cursor()
            # now execute the query. (comment this line out if you are executing a prepared statement).
            self.cursor.execute(query)

            self.conn.commit()
            result.append(self.cursor.fetchall())

        except psycopg2.Error as e:
            msg_tpl = ('Your search did not succeed, try again.', ' ')
            result.append(msg_tpl)
        return result

    def add_claim(self, claim_date, doc, patient):
        try:
            # TODO6: Add a statement to set the isolation level to protect the claims table
            # from having a patient with more than one claim. Complete and test the other TODOs below
            # before adding this statement.
            self.conn.set_isolation_level(
                extensions.ISOLATION_LEVEL_SERIALIZABLE)

            # Query to check if patient already has a claim.
            # query = "select count(*) from claims where patient='"+patient+"';"

            # TODO1: Replace the query above with a prepared statement:
            query = "select count(*) from claims where patient= (%s);"
            data = (patient,)

            self.cursor = self.conn.cursor()

            # TODO2: Replace the statement below with a statement to execute the prepared statement and data:
            self.cursor.execute(query, data)

            num_claims = self.cursor.fetchone()[0]

            if num_claims > 0:
                print("Cannot add claim. The patient already has one claim.\n")
                return
            else:
                print("A claim can be added for this patient- processing...\n")
                time.sleep(3)

            # add the new claim
            # TODO3: First, write a query to get the max claim_id in the table to increment for the new row's claim_id.
            # This does not have to be a parameterized query (as there are no parameters).
            # Use the cursor object to execute the query.
            # Assign the return value to a variable such as max_claim_id.
            # Use the cursor fetchone method to obtain this value.
            query = "select max(claim_id) from claims"
            self.cursor.execute(query)
            max_claim_id = self.cursor.fetchone()[0]

            # TODO4: Write a parameterized query composed of the three parameters passed to this method plus the incremented
            # max_claim_id, which will be the primary key for the new row in the claims table.
            query = "insert into claims(claim_id, claim_date, doc, patient) values ((%s), (%s), (%s), (%s))"
            data = (max_claim_id + 1, claim_date, doc, patient)

            # TODO5: Write the call to execute the prepared statement and the data:
            self.cursor.execute(query, data)

            self.conn.commit()

            print("Claim added successfully.\n")

        except psycopg2.Error as e:
            print('Error while adding claim, try again.\n' + str(e))

    # Closing the connection
    def close_db(self):
        self.conn.close()
