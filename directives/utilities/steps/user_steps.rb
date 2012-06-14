step /^An account with username (.+) and password (.+) exists$/ do |username, password|
  true.must_equal true
end

step /^Delete the account with username Bob at exit$/ do
  # do stuff here
end

step /^The account with username (.+) has a role of (.+)$/ do |username, role_name|
  puts role_name
  # do stuff here
end