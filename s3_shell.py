"""
interactive shell to facilitate exploration/management of s3 buckets
http://boto.readthedocs.org/en/latest/s3_tut.html
"""

"""
NB region is only required to create a bucket; hence pass as arg to create_bucket rather than an shell arg
"""

from boto.s3.key import Key

import boto, cmd, os, yaml

Region="eu-west-1"

def handle_boto_errors(fn):
    def wrapped_fn(self, *args, **kwargs):
        # http://boto.readthedocs.org/en/latest/ref/boto.html
        try:
            return fn(self, *args, **kwargs)
        except boto.exception.S3CopyError, error:
            print str(error)
        except boto.exception.S3CreateError, error:
            print str(error)
        except boto.exception.S3DataError, error:
            print str(error)
        except boto.exception.S3PermissionsError, error:
            print str(error)
        except boto.exception.S3ResponseError, error:
            print str(error)
    return wrapped_fn

def split_line(fn):
    def wrapped_fn(self, line, *args, **kwargs):
        try:
            tokens=[tok for tok in line.split(" ")
                    if tok!='']
            newargs=tuple(tokens+list(args))
            return fn(self, *newargs, **kwargs)
        except TypeError, error:
            print str(error)
    return wrapped_fn

class S3Shell(cmd.Cmd):
    
    prompt=">>> "

    def __init__(self, creds):
        cmd.Cmd.__init__(self)
        self.conn=boto.s3.connect_to_region(Region,
                                            aws_access_key_id=creds["key"],
                                            aws_secret_access_key=creds["secret_key"],
                                            is_secure=True)

    def emptyline(self):
        pass

    def preloop(self):
        print self.conn

    @handle_boto_errors
    def do_list_buckets(self, line):
        for bucket in self.conn.get_all_buckets():
            # print "%s [%s]" % (bucket.name, bucket.get_location())
            print bucket.name # bucket.get_location() takes time and isn't really important

    @handle_boto_errors
    @split_line
    def do_create_bucket(self, bucketname, region):
        print self.conn.create_bucket(bucketname,
                                      location=region)

    @handle_boto_errors
    def do_delete_bucket(self, bucketname):
        print self.conn.delete_bucket(bucketname)

    @handle_boto_errors
    def do_list_objects(self, bucketname):
        for key in self.conn.get_bucket(bucketname):
            print key.name

    @handle_boto_errors
    @split_line
    def do_search_objects(self, bucketname, prefix):
        bucket=self.conn.get_bucket(bucketname)
        for key in bucket.list(prefix):
            print key.name

    @handle_boto_errors
    def do_empty_bucket(self, bucketname):
        bucket=self.conn.get_bucket(bucketname)
        for key in bucket:
            print key.name
            bucket.delete_key(key)
            
    @handle_boto_errors
    @split_line
    def do_deploy(self, bucketname, root="site"):
        bucket=self.conn.get_bucket(bucketname)
        def deploy(path):
            for item in os.listdir(path):
                abspath=path+"/"+item
                if os.path.isdir(abspath):
                    deploy(abspath)
                else:
                    print abspath
                    key=abspath[len(root)+1:]
                    awskey=Key(bucket)
                    awskey.key=key
                    awskey.set_contents_from_file(file(abspath))
        deploy(root)
        
    def do_exit(self, line): 
        return True

    def do_quit(self, line):
        return True

    def postloop(self):
        print "Exiting .."

if __name__=="__main__":
    try:
        creds=yaml.load(file("tmp/aws_creds.yaml").read())
        args={"creds": creds}
        S3Shell(**args).cmdloop()
    except RuntimeError, error:
        print "Error:%s" % str(error)


