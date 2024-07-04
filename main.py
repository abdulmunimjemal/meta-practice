from hyperon import MeTTa

def run(code: str):
    metta = MeTTa()
    return metta.run(code)

# read the code from file

if __name__ == "__main__":
    default_path = "metta_codes/"
    # run all files with .metta extension or run a specific file
    # get input from user
    file_name = input("Do you want to run a specific file? (y/n): ")
    if file_name == "y":
        file_name = input("Enter the file name: ")
        with open(default_path + file_name, "r") as file:
            code = file.read()
            print(run(code))
    else:
        for file_name in os.listdir(default_path):
            if file_name.endswith(".metta"):
                with open(default_path + file_name, "r") as file:
                    code = file.read()
                    print(run(code))