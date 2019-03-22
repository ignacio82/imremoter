IMS3::set.enviroment() # A personal package that sets my S3 credentials

put_object("./example.Rmd", bucket = "ignacios-test-bucket", object = "example.Rmd") # Saves the markdown to my S3 bucket

remoter::batch(addr = IMSecrets::IMremoter()$addr, 
               port = IMSecrets::IMremoter()$port, 
               password = IMSecrets::IMremoter()$password, 
               file = "script.R") # Runs my script on my remote R instance

aws.s3::s3sync(bucket = "ignacios-test-bucket", direction = "download") # Download the results

