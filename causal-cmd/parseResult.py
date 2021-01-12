import argparse
from datetime import datetime

outfile = "dagitty_string_" + datetime.now().strftime("%d-%m-%Y_%H%M%S") + ".txt"

parser = argparse.ArgumentParser()
parser.add_argument("filename")
args = parser.parse_args()
filename = args.filename

variables = ["rdef1","rdef2","rdef3","rdef4","rdef5","rdef6","rdef7","rdef8","rxasp","rxhep","ddiagisc","ddiagha","drsisc","drsh","dpe","ddead","age","sex","rsbp","occode","LACS","OTH","PACS","POCS","TACS"]

with open(filename, "rt") as f:
    with open(outfile, "w+") as out:
        out.write("dag{\n")
        for variable in variables:
            out.write(variable + "\n")
        for line in f:
            contents = line.split(" ")
            if contents[2] == "-->":
                arrow = "->"
            elif contents[2] == "---":
                arrow = "<->"
            outstring = "{0} {1} {2}".format(contents[1].replace("\"", ""), arrow, contents[3].replace("\"", ""))
            out.write(outstring)
        out.write("\n}")
