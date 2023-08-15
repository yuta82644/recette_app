server '35.78.55.47', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yuta/.ssh/id_rsa'