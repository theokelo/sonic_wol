"""
- script to clone all sample.rb files
"""

import os, re

def clone(srcdir, destdir):
    def clone(currentdir):
        for item in os.listdir(currentdir):
            newitem=currentdir+"/"+item
            if os.path.isdir(newitem):
                print "[dir] %s" % item
                clone(newitem)
            else:
                print "[file] %s" % item                            
                text=file(newitem).read()
                dest=file(destdir+"/"+item, 'w')
                dest.write(text)
                dest.close()
    clone(srcdir)

if __name__=="__main__":
    clone("../sonic-pi-master/etc/examples", "./demos/sonic_pi_examples")
