print("Testing")
with open('output.txt', 'r') as file:
    lines = file.readlines()
    for i in range(len(lines)):
        if "[Invited]" in lines[i]:
            print(lines[i+2])

