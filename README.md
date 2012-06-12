Norm
====
A framework that let's you write executable software documentation.

How it Works
------------

**Step 1: Write .requirements files**

You start by writing requirements with the following format (Pretend
that we're writing requirements for a bug tracking software)

```
Create Tickets
==============

  * A user who is a <Role> <Can or Cannot Create> 
    tickets in it
  
    Examples:
      | Role    | Can or Cannot Create |
      |---------|----------------------|
      | Manager | Can Create           |
      | Member  | Can Create           |
      | Guest   | Cannot Create        |
      
    Notes:
      Arbitrary text that the business analyst or domain expert
      thinks might help the development team understand the 
      problem much better. Blah blah blah.


  * Newly created tickets have a status of 'Open'
  
    IMPORTANT:
      More arbitrary text written by the domain expert.
      Blah blah blah blah. The quick brown lorem ipsum
      jumped over the dolor sit blah.
```

Notes:

 * Text underlined by `=` characters above serves as the 'group name' 
   for the requirements that follow it
 * Text that begin with an asterisk `*` is considered a requirement
 * Requirements can wrap to the next line. The end of a requirement 
   spec is marked by two newline characters.
 * The keywords `Examples:` and `Notes:` are not really keywords. They're 
   just arbitrary text that the writer can add for clarity. The compiler
   will ignore them.
 * Tables may or may not have borders. In the above, the border below the
   header row may be safely ommitted.
 * Notice that there are no word-like keywords in the above syntax making 
   it il8n-ready at the onset.
   
**Step 2: Write .testcases files**

Next, write test case templates that will match the requirements above. For example:

```
Test Case:
  A user who is a (.+) can create tickets in it
  
  Variables:
    * Role Name   = $1
    * My Username = my_username
    * My Password = my_password

  Preconditions:
    * An account with username <My Username> and password <My Password> exists
    * The account with username <My Username> has a role of <Role Name>
    * I am logged out
  
  Cleanup:
    * Delete the account with username <My Username> at exit
  
  Script:
    * Visit the Login page
    * Fill in the Username field with <My Username>
    * Fill in the Password field with <My Password>
    * Click the Login button
    * The New Ticket button should be enabled

(etc...More test cases...etc)
```

**Step 3: Compile**

Run `norm` to compile the above into [minitest](https://github.com/seattlerb/minitest) specs. For example, the above files will generate:

```
require 'minitest/autorun'

describe 'A user who is a Manager of a project can create tickets in it' do
    before do
      step "An account with username #{ my_username } and password #{ my_password } exists"
      step "The account with username #{ my_username } has a role of #{ 'Manager' }"
      step "I am logged out"
    end
    
    after do
      step "Delete the account with username #{ my_username } at exit"
    end
    
    describe 'A user who is a Manager of a project can create tickets in it' do
      step "Visit the Login page"
      step "Fill in the Username field with #{ my_username }"
      step "Fill in the Password field with #{ my_password }"
      step "Click the Login button"
      step "The New Ticket button should be enabled"
    end
end

(etc...More test cases...etc)
```

Notes:

  * Norm only re-compiles the test cases when at least one .requirements or .test_cases files have a modification date more recent than the compiled test file.