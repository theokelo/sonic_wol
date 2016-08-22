# https://github.com/supercollider/supercollider/blob/master/examples/demonstrations/stealthissound.scd

import re

def tokenize(text):
    def tokenize(text):
        return [tok for tok in text.split("\n")
                if (tok!='' and
                    not re.sub("\\s", "", tok).startswith("//"))]
    groups=[[]]
    for token in tokenize(text):
        if token in ['(', ')']:
            groups.append([])
        else:
            groups[-1].append(token)
            if re.search("\\.((add)|(play))\\;?$", token):
                groups.append([])
    return ["\n".join(group)
            for group in groups
            if group!=[]]

def parse(srcfile, destdir):
    text=file(srcfile).read()
    for token in tokenize(text):
        if not token.startswith("SynthDef"):
            continue
        args=[tok for tok in re.split("\\W", token.split("\n")[0])
              if tok!='']
        print args[1]
        dest=file("%s/%s.scd" % (destdir, args[1]), 'w')
        dest.write(re.sub("\\.((add)|(play))\\;", "", token))
        dest.close()

if __name__=="__main__":
    parse("./dev/stealthissound.scd", "synthdefs/stealthissound")
    
            

