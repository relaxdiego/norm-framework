require 'spec_helper'
require 'ba_speak/lexer'

module BaSpeak

  describe Lexer do

    it "must tokenize the group name" do
      output = tokenize <<-EOF
               Create a Project
               ================
               EOF
      tokens = [ [:GROUP, 'Create a Project'] ]
      output.must_equal tokens
    end

    it "must tokenize strings" do
      output = tokenize <<-EOF
               Arbitrary text
               of the unusual kind
               EOF
      tokens = [ [:TEXT, 'Arbitrary text of the unusual kind'] ]
      output.must_equal tokens
    end

    it "must tokenize a requirement" do
      output = tokenize <<-EOF
               * A project without a name is invalid
               EOF
      tokens = [ [:REQUIREMENT, 'A project without a name is invalid'] ]
      output.must_equal tokens
    end

    it "must tokenize a requirement followed by arbitrary text" do
      output = tokenize <<-EOF
               * A project without a name is invalid

                 Example:
                   Arbitrary text
               EOF
      tokens = [ [:REQUIREMENT, 'A project without a name is invalid'], [:TEXT, 'Example: Arbitrary text'] ]
      output.must_equal tokens
    end

    it "must tokenize a multi-line requirement" do
      output = tokenize <<-EOF
               * A project without a
                 name is invalid
               EOF
      tokens = [ [:REQUIREMENT, 'A project without a name is invalid'] ]
      output.must_equal tokens
    end

    it "must tokenize a multi-line requirement followed by arbitrary text" do
      output = tokenize <<-EOF
               * A project without
                 a name is invalid

                 Example:
                   Arbitrary text
               EOF
      tokens = [ [:REQUIREMENT, 'A project without a name is invalid'], [:TEXT, 'Example: Arbitrary text'] ]
      output.must_equal tokens
    end

    it "must tokenize tables" do
      output = tokenize <<-EOF
                | Name      | Description       |
                | Project A | First Project     |
                | Project B | Second Project    |
              EOF
      tokens = [
                 [:ROW, 'Row'], [:CELL, 'Name'],      [:CELL, 'Description'],
                 [:ROW, 'Row'], [:CELL, 'Project A'], [:CELL, 'First Project'],
                 [:ROW, 'Row'], [:CELL, 'Project B'], [:CELL, 'Second Project']
               ]
      output.must_equal tokens
    end

    it "must ignore table borders" do
      output = tokenize <<-EOF
                | Name      | Description       |
                |-----------|-------------------|
                | Project A | First Project     |
                | Project B | Second Project    |
              EOF
      tokens = [
                 [:ROW, 'Row'], [:CELL, 'Name'],      [:CELL, 'Description'],
                 [:ROW, 'Row'], [:CELL, 'Project A'], [:CELL, 'First Project'],
                 [:ROW, 'Row'], [:CELL, 'Project B'], [:CELL, 'Second Project']
               ]
      output.must_equal tokens
    end

    it "must tokenize requirements with placeholders" do
      output = tokenize <<-EOF
               * Given <Role>
                 <Something>
               EOF
      tokens = [ [:REQUIREMENT, 'Given <Role> <Something>'] ]
      output.must_equal tokens
    end

    it "must tokenize a full requirements file" do
      output = tokenize <<-EOF
             Create a Project
             ================

             * Given a user has a role of <Role> in the system
               Then he <Can or Cannot Create> projects

               Examples:
                 | Role  | Can or Cannot Create |
                 | Admin | Can Create           |
                 | User  | Cannot Create        |

               Notes:
                 The quick brown fox jumps over the lazy
                 dog. The quick brown fox jumps.
             EOF
      tokens = [
                 [:GROUP, 'Create a Project'],
                 [:REQUIREMENT, 'Given a user has a role of <Role> in the system Then he <Can or Cannot Create> projects'],
                 [:TEXT, 'Examples:'],
                 [:ROW, 'Row'], [:CELL, 'Role'], [:CELL, 'Can or Cannot Create'],
                 [:ROW, 'Row'], [:CELL, 'Admin'], [:CELL, 'Can Create'],
                 [:ROW, 'Row'], [:CELL, 'User'], [:CELL, 'Cannot Create'],
                 [:TEXT, 'Notes: The quick brown fox jumps over the lazy dog. The quick brown fox jumps.']
               ]
      output.must_equal tokens
    end

    def tokenize(data)
      Lexer.new.tokenize(data)
    end

  end # describe Lexer

end # module BaSpeak