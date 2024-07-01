import sys

uuid = sys.argv[1]
acceptance = "..Thank you for accepting review " + uuid
with open('output.txt', 'r') as file:
    lines = file.readlines()
    for i in range(len(lines)):
        if acceptance in lines[i]:
            print("Accepted")
            sys.exit(0)

    print("Not accepted")
