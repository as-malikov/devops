#!/usr/bin/expect -f
set timeout 20
spawn scp src/cat/my_cat src/grep/my_grep iroot@10.0.2.5:/home/iroot/

expect {
  "*yes/no" { send -- "yes\r" }
  "*password" { send -- "2233\r" }
}
expect {
  "*yes/no" { send -- "yes\r" }
  "*password" { send -- "2233\r" }
}
spawn ssh iroot@10.0.2.5 "echo 2233 | sudo -S mv my_cat my_grep /usr/local/bin/"
expect "*password*"
send -- "2233\r"
expect eof
