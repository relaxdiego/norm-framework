step /^An account with username (.+) and password (.+) exists$/ do |username, password|
  true.must_equal true
end

step /^Delete the account with username Bob at exit$/ do
  # do stuff here
end

step /^The account with username Bob has a role of Temp$/ do
  # do stuff here
end