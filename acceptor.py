acceptance = "..Thank you for accepting review"
with open('output.txt', 'r') as file:
    lines = file.readlines()
    for i in range(len(lines)):
        if acceptance in lines[i]:
            print("Accepted")
            break
