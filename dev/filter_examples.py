"""
- script to filter all sample.rb files in /etc/examples
"""

import os, re

def filter(srcdir, destdir):
    def filter(currentdir):
        for item in os.listdir(currentdir):
            newitem=currentdir+"/"+item
            if os.path.isdir(newitem):
                print "[dir] %s" % item
                filter(newitem)
            else:
                print "[file] %s" % item                            
                text=file(newitem).read()
                dest=file(destdir+"/"+item, 'w')
                dest.write(text)
                dest.close()
    filter(srcdir)

if __name__=="__main__":
    filter("../sonic-pi-master/etc/examples", "./demos/sonic_pi/examples")
