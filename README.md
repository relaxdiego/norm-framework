Norm
====
Norm is a virtual robot that helps software teams auto-verify
business requirements against an application. Feed him requirement
files, their corresponding test cases, and the definition of
each step used in the test cases. Norm will then report back the
status of each requirement.

Here's a [video demo](http://www.youtube.com/watch?v=RuC8owWbdQA&feature=g-upl).

Usage
-----

**Step 1: Write Requirements**

The business analyst writes requirements using the "BA Speak" syntax.
For example:

```
Create Tickets
==============

  * A user who has a role of <Role> in the system
    <Can or Cannot Create> support tickets

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

Next, QA writes test case templates that apply to one or more requirements
by using the "QA Speak" syntax. For example:

```
Test Case:
  A user who has a role of (.+) in the system can create support tickets

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
```

Notes:

  * The test case name can be a string or a regular expression
  * The test case file can be any text file but the convention is to
    use the .test_cases file extension
  * Norm looks for test case file in `directives/test_cases` although
    this can be customized.

**Step 3: Define re-usable steps**

A programmer writes the equivalent Ruby code for the steps used in the test cases. For example:

```
step /^Visit the (.+) page$/i do |page_name|
  # Add Ruby code here
end

step /^Fill in the (.+) field with (.+)$/i do |field_name, value|
  # Add Ruby code here
end

step /^Click the (.+) button$/i do |button_name|
  # Add Ruby code here
end
```

**Step 4: Run it!**

Run `bin/norm` to compile and execute the above directives:

```
$ bin/norm
Run options: --seed 51346

# Running tests:

.......

Finished tests in 0.004842s, 1445.6836 tests/s, 826.1049 assertions/s.

7 tests, 4 assertions, 0 failures, 0 errors, 0 skips
```