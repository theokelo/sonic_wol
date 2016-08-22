"""
- script to parse synth documentation from synths.md
"""

# https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/synths.md

import re

if __name__=="__main__":
    text=file("dev/synths.md").read()    
    rows=text.split("\n")
    for i, row in enumerate(rows):
        if row=="### Key:":
            name=re.sub("\\s", "", rows[i+1])[1:]
            print "name: %s" % name
        elif row=="### Doc:":
            desc=" ".join([tok for tok in re.split("\\s", rows[i+1])
                           if tok!=''])
            print "desc: %s" % desc
        elif row=="### Opts:":
            print "[opts]"

