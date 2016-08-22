"""
- script to parse synth documentation from synths.md
"""

# https://github.com/samaaron/sonic-pi/blob/master/etc/doc/cheatsheets/synths.md

if __name__=="__main__":
    text=file("dev/synths.md").read()    
    print text
