#!/bin/bash

# install expect
package_name="expect"

if dpkg -l | grep -q "ii  $package_name "; then
  echo "$package_name is already installed."
  # echo 
else
  echo "$package_name is not installed. Installing it now..."
  sudo apt update
  sudo apt install -y "$package_name"
  if [ $? -eq 0 ]; then
    echo "$package_name has been successfully installed."
  else
    echo "Failed to install $package_name."
  fi
fi


# Your Git repository URL
#repo_url="https://github.com/Mediusware-Ltd/mediusware_erp"

# Your Git username (you can customize this)
git_username="mdishmam"

# Your Git access token (generate one from your Git provider)
git_access_token="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"

# Run the Git command with expect
expect << EOF
spawn git "$@"

# Conditional logic inside expect
expect {
    "Username for 'https://github.com':" {
        send "${git_username}\r"
        expect {
            "Password for 'https://${git_username}@github.com':" {
                send "${git_access_token}\r"
                expect eof
            }
        }
    }
    timeout {
        send "echo done.\r"
    }
}
# Wait for the spawned process to finish
wait
EOF


# expect <<EOF
# spawn git $@
# expect {
# 		"Username for 'https://github.com':"{
# 			send "${git_username}\r"
# 			expect "Password for 'https://${git_username}@github.com':"
# 			send "${git_access_token}\r"
# 			expect eof
# 		}
# 		timeout {
#         send "echo done."
#     }
# 	}


# EOF


# expect <<EOF
# spawn git $@
# expect "Username for 'https://github.com':"
# send "${git_username}\r"
# expect "Password for 'https://${git_username}@github.com':"
# send "${git_access_token}\r"
# expect eof
# EOF

# if [ $1 == clone ]
#  then
# 	# Run git pull with expect
# 	expect <<EOF
# 	spawn git $@
# 	expect "Username for 'https://github.com':"
# 	send "${git_username}\r"
# 	expect "Password for 'https://${git_username}@github.com':"
# 	send "${git_access_token}\r"
# 	expect eof
# EOF


# elif [ $1 == pull ]
#  then
# 	# Run git pull with expect
# 	expect <<EOF
# 	spawn git $@
# 	expect "Username for 'https://github.com':"
# 	send "${git_username}\r"
# 	expect "Password for 'https://${git_username}@github.com':"
# 	send "${git_access_token}\r"
# 	expect eof
# EOF
	
# elif [ $1 == push ]
#  then
# 	expect <<EOF
# 	spawn git "$@"
# 	expect "Username for 'https://github.com':"
# 	send "${git_username}\r"
# 	expect "Password for 'https://${git_username}@github.com':"
# 	send "${git_access_token}\r"
# 	expect eof
# EOF

# elif [ $1 == fetch ]
#  then
# 	expect <<EOF
# 	spawn git "$@"
# 	expect "Username for 'https://github.com':"
# 	send "${git_username}\r"
# 	expect "Password for 'https://${git_username}@github.com':"
# 	send "${git_access_token}\r"
# 	expect eof
# EOF

# else
# 	expect <<EOF
# 	spawn git "$@"
# 	expect {
# 		"Username for 'https://github.com':"{
# 			send "${git_username}\r"
# 			expect "Password for 'https://${git_username}@github.com':"
# 			send "${git_access_token}\r"
# 			expect eof
# 		}

# 	}
# EOF
# fi
