Zipping and Unzipping
========================

There are a lot of different types of (un)zipping protocols out there and many different packages that do this for you. 

## Different packages:

 * tar
 * zip | unzip
 * gzip
 
### tar Commands [[link](http://www.computerhope.com/unix/utar.htm)]

 * `tar cf tarBall.tar [file] [file]` - Create archive that contains files
 * `tar tvf tarBall.tar` - List files in archive
 * `tar xf tarBall.tar` - Extracts files from `.tar` file
 * `tar xzvf tarBall.tar.gz` - Extracts files from `.tar.gz` file
 * `tar xvf tarBall.tar [file/dir]` - Extracts only a file/dir from`.tar` file
 * `tar xvf archive.tar --wildcards '.ext'` - Extracts using [wildcards](http://en.wikipedia.org/wiki/Wildcard_character)

