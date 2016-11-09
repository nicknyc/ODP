# README

## Lastest update based on
* Ruby version 2.3.1
* Rails version 5.0.0.1



## Installation

0. set up MySQL server from http://dev.mysql.com/downloads/installer/  make your root password = password

1. Windows  
 * just download installer from https://www.ruby-lang.org/en/documentation/installation/#rubyinstaller


2. Mac
 * follow instruction from www.gorails.com
 * for El capitain: https://gorails.com/setup/osx/10.11-el-capitan
 * set up MySQL server from http://dev.mysql.com/downloads/installer/  


## Deployment instructions
after pull this to your local go there and run these in command line/terminal
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s
```
Then, it should be running on localhost:3000

## Terminate server
Just simply type Ctrl + C
