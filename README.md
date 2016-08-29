# clicking 
# 2016-08-29

echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save

# S3
# 2016-08-29

http://sonic-wol.s3-website-eu-west-1.amazonaws.com/

http://stackoverflow.com/questions/26691286/amazon-s3-bucket-returning-403-forbidden

Properties -> Static Website Hosting
Properties -> Permissions -> Everyone 
[add bucket policy as per SO link above]


# initialisation
# 2016-08-20

- jackd -R -d alsa -d hw:1
- sonic-pi