"""
- script to run iterate through Sonic Pi /src/examples and copy all files containig 'Sam Aaron'
"""

import os, re

def copy(srcdir, destdir):
    def copy(currentdir):
        for item in os.listdir(currentdir):
            # print currentdir+"/"+item
            if os.path.isdir(currentdir+"/"+item):
                print "[dir] %s" % item
                copy(currentdir+"/"+item)
            else:
                print "[file] %s" % item                            
                text=file(currentdir+"/"+item).read()
                dest=file(destdir+"/"+item, 'w')
                dest.write(text)
                dest.close()
    copy(srcdir)

if __name__=="__main__":
    copy("../sonic-pi-master/etc/examples", "./sonic_pi_examples")