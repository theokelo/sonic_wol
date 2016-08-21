import re

if __name__=="__main__":
    text=file("dev/stealthissound.scd").read()
    tokens=[tok for tok in text.split("\n")
            if (tok!='' and
                not re.sub("\\s", "", tok).startswith("//"))]
    dest=file("tmp/stealthissound.scd", 'w')
    dest.write("\n".join(tokens))
    dest.close()
