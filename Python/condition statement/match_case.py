colour = input("Enter a colour: ")

match colour:
    case "Green":
        print("GO")
    case "Yellow":
        print("Wait")
    case "Red":
        print("Stop")
    case _: # for the default print , if non the above true
        print("Wrong colour")