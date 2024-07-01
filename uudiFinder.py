with open('output.txt', 'r') as file:
    lines = file.readlines()
    for i in range(len(lines)):
        if "[Assigned]" in lines[i]:
            acceptLine = lines[i+2]
            #print(acceptLine)
            break

    uuid = acceptLine.split(" ")[2]
    print(uuid)
