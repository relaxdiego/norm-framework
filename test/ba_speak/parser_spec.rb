require 'spec_helper'
require 'ba_speak/parser'

module BaSpeak

  describe Parser do

    it "must parse an empty file" do
      output  = parse ""
      nodes   = RootNode.new
      output.must_equal nodes
    end

    it "must parse an empty group" do
      output = parse <<-EOF
               Create a Project
               ================
               EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project')
              ])
      output.must_equal nodes
    end

    it "must parse multiple empty groups" do
      output = parse <<-EOF
               Create a Project
               ================

               Create a User
               =============
               EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project'),
                GroupNode.new('Create a User')
              ])
      output.must_equal nodes
    end

    it "must parse requirements" do
      output = parse <<-EOF
               Create a Project
               ================

                 * Given a user with role <Role>
             EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project', [
                  RequirementNode.new('Given a user with role <Role>')
                ])
              ])
      output.must_equal nodes
    end

    it "must parse a multi-line requirement" do
      output = parse <<-EOF
               Create a Project
               ================

                 * Given a
                   user with
                   role <Role>
             EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project', [
                  RequirementNode.new("Given a user with role <Role>")
                ])
              ])
      output.must_equal nodes
    end

    it "must parse multiple non-empty groups" do
      output = parse <<-EOF
               Create a Project
               ================

                 * Projects without names are invalid

               Create a User
               =============

                 * Users with names are valid
               EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project', [
                  RequirementNode.new('Projects without names are invalid')
                ]),
                GroupNode.new('Create a User', [
                  RequirementNode.new('Users with names are valid')
                ])
              ])
      output.must_equal nodes
    end

    it "must parse tables" do
      output = parse <<-EOF
               Create a Project
               ================

               * Given a
                 user with
                 role <Role>

                 Examples:
                  | Role | Remarks |
                  | PM   | ARRR    |
                  | User | RAAA    |
             EOF
      nodes = RootNode.new('', [
                GroupNode.new('Create a Project', [
                  RequirementNode.new("Given a user with role <Role>", [
                    ExamplesNode.new('', [
                      RowNode.new('', ['Role', 'Remarks']),
                      RowNode.new('', ['PM', 'ARRR']),
                      RowNode.new('', ['User', 'RAAA'])
                    ])
                  ])
                ])
              ])
      output.must_equal nodes
    end

    it "must parse multiple requirements" do
      output = parse <<-EOF
               Project Management
               ==================

               * A <Role> in the system <Can or Cannot Create> projects

                   | Role | Can or Cannot Create |
                   |------|----------------------|
                   | PM   | Can Create           |
                   | User | Cannot Create        |

               * An empty project is invalid
             EOF
      nodes = RootNode.new('', [
                GroupNode.new('Project Management', [
                  RequirementNode.new("A <Role> in the system <Can or Cannot Create> projects", [
                    ExamplesNode.new('', [
                      RowNode.new('', ['Role', 'Can or Cannot Create']),
                      RowNode.new('', ['PM', 'Can Create']),
                      RowNode.new('', ['User', 'Cannot Create'])
                    ])
                  ]),
                  RequirementNode.new("An empty project is invalid", [])
                ])
              ])
      output.must_equal nodes
    end

    def parse(file, show_tokens = false)
      Parser.new.parse(file, show_tokens)
    end

  end

end