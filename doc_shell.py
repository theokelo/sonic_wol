"""  
- grep -> search demos
- list -> synths, effects
- man -> synth headers
"""

import cmd

class DocShell(cmd.Cmd):
    
    prompt=">>> "

    def __init__(self):
        cmd.Cmd.__init__(self)

    # start helpers

    def emptyline(self):
        pass

    def preloop(self):
        print "Welcome to Sonic-Pi docs!"
        pass

    # helpers

    def do_hello(self, line):
        print "Hello World!"

    # end helpers

    def do_exit(self, line): 
        return True

    def do_quit(self, line):
        return True

    def postloop(self):
        pass

if __name__=="__main__":
    DocShell().cmdloop()
