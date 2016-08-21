"""
- script to filter all code blocks from /etc/doc/tutorial
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
                # print "[file] %s" % item                            
                text=file(newitem).read()
                tokens=re.split("```", text)[1:][::2]
                count=0
                for token in tokens:
                    if "live_loop" not in token:
                        continue
                    filename="%s~%i.rb" % (re.sub("\\W|\\.", "~", item[:-3]),
                                           count)
                    print "[file] %s" % filename                            
                    dest=file(destdir+"/"+filename, 'w')
                    dest.write(token)
                    dest.close()
                    count+=1
    filter(srcdir)

if __name__=="__main__":
    filter("../sonic-pi-master/etc/doc/tutorial",  "./demos/sonic_pi/tutorial")
