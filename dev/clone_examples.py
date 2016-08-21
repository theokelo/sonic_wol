"""
- script to copy all examples
"""

import os, re

def copy(srcdir, destdir):
    def copy(currentdir):
        for item in os.listdir(currentdir):
            newitem=currentdir+"/"+item
            if os.path.isdir(newitem):
                print "[dir] %s" % item
                copy(newitem)
            else:
                print "[file] %s" % item                            
                text=file(newitem).read()
                dest=file(destdir+"/"+item, 'w')
                dest.write(text)
                dest.close()
    copy(srcdir)

if __name__=="__main__":
    copy("../sonic-pi-master/etc/examples", "./demos/sonic_pi_examples")
