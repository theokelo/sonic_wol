"""
- script to run iterate through Sonic Pi /src/examples and copy all files containig 'Sam Aaron'
"""

import os

def copy(srcdir, destdir):
    def copy(currentdir):
        for item in os.listdir(currentdir):
            print currentdir+"/"+item
            if os.path.isdir(currentdir+"/"+item):
                copy(currentdir+"/"+item)
            else:
                text=file(currentdir+"/"+item).read()
                if re.search("sam aaron", text, re.I):
                    dest=file(destdir+"/"+item, 'w')
                    dest.write(text)
                    dest.close()
                else:
                    pass
    copy(srcdir)

if __name__=="__main__":
    copydir("~/sonic-pi/etc/examples", "./sonic_pi_examples")
