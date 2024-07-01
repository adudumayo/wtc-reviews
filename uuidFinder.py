with open('output.txt', 'r') as file:
    lines = file.readlines()
    for i in range(len(lines)):
        if "[Assigned]" in lines[i]:
            acceptLine = lines[i+2]
            break

    try:
        uuid = acceptLine.split(" ")[2]
        print(uuid)
    except NameError as e:
        print("Not a uuid")
