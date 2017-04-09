import argparse
import getpass
import os
import os.path

import jinja2

preseed_vars = {}

parser = argparse.ArgumentParser()
parser.add_argument('--build-type', dest="build_type")
args = parser.parse_args()
build_type = args.build_type
preseed_vars["build_type"] = build_type
preseed_template_name = "{0}.cfg".format(args.build_type)
preseed_template_path = os.getcwd() + "/preseed/" + preseed_template_name

if build_type == "physical":
    preseed_vars["user_password"] = getpass.getpass("User password: ")
    preseed_vars["disk_password"] = getpass.getpass("Disk password: ")
else:
    preseed_vars["user_password"] = 

with open(preseed_template_path, "r") as preseed_template_handle:
    preseed_template_str = preseed_template_handle.read()
preseed_template = jinja2.Template(preseed_template_str)
