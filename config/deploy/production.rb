server '176.34.32.250', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yuta/.ssh/id_rsa'