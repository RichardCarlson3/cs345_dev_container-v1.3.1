
from DBConnector import DBConnector

dbconn = DBConnector()
dbconn.connect_to_db()


def print_result(result):
    """prints the result set, which is a list of tuples.
       prints no matches found if no tuples in list."""
    res_list = result[0]
    if len(res_list) == 0:
        print('no matches found')
    for i in range(len(res_list)):
        print(res_list[i])


not_done = True

print("Welcome to CS345 Lab 8.")

print("Enter the query you want to execute by typing a number from the menu below:")

while not_done:
    print("1- Find claims for a specific doctor and patient.\n" +
          "2- Find a patient's record using the patient's first and last name.\n" +
          "X- to quit.")
    choice = input()
    if choice == 'X' or choice == 'x':
        break
    elif choice == '1':
        print("Enter the doctor's name:")
        doc = input()
        print("Enter the patient's name:")
        patient = input()
        print("You entered doc: " + doc + ", patient: " + patient)
        result = dbconn.get_claim(doc, patient)
        print("result: \n")
        print_result(result)
    elif choice == '2':
        print("Enter the patient's first name:")
        fname = input()
        print("Enter the patient's last name:")
        lname = input()
        print("You entered first name: " + fname + ", last name: " + lname)
        result = dbconn.get_patient_record(fname, lname)
        print("result: \n")
        print_result(result)
# clean up
dbconn.close_db()

if __name__ == "__main__":
    print("Have a nice day!")
