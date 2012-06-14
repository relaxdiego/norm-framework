Norm (Prototype 4)
==================
Norm is a robot that you can feed business requirements, their corresponding
test cases, and the steps that can be used within those test cases. He will then
combine all of these information to build and run their equivalent [MiniTest](https://github.com/seattlerb/minitest) specs.

How it Works
------------

**Step 1: Write Requirements**

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
 * The requirements file can be any text file but the convention is to
   use the .requirements file extension
 * Norm looks for requirements file in `directives/requirements` although
   this can be customized.

**Step 2: Write Test Cases**

Next, write test case templates that will match the requirements above. For
example:

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

Notes:

  * The test case file can be any text file but the convention is to
    use the .test_cases file extension
  * Norm looks for test case file in `directives/test_cases` although
    this can be customized.

**Step 3: Compile**

Run `bin/norm` to compile the above into [MiniTest](https://github.com/seattlerb/minitest) specs.
For example, the above files might generate:

```
describe 'Test Suite' do

  before do
    # Initialize the test suite's runtime objects
    # e.g. @steps
  end

  describe 'Create Tickets' do

    describe 'A user who is a Manager of a project can create tickets in it' do
      before do
        Steps.call "An account with username #{ my_username } and password #{ my_password } exists"
        Steps.call "The account with username #{ my_username } has a role of #{ 'Manager' }"
        Steps.call "I am logged out"
      end

      after do
        Steps.call "Delete the account with username #{ my_username } at exit"
      end

      it 'must pass' do
        Steps.call "Visit the Login page"
        Steps.call "Fill in the Username field with #{ my_username }"
        Steps.call "Fill in the Password field with #{ my_password }"
        Steps.call "Click the Login button"
        Steps.call "The New Ticket button should be enabled"
      end
    end

    (etc...More test cases...etc)

  end

  (etc...More groups...etc)
end
```