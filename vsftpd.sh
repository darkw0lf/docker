#!/bin/sh

docker pull sayers3/vsftpd.2.3.4:latest

docker run -d -p 21:21 sayers3/vsftpd.2.3.4:latest
