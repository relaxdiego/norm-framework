module QaSpeak

  class Node
    attr_reader :children, :name

    def initialize(name='', children=[])
      @children = children
      @name     = name
    end

    def ==(other_node)
      name == other_node.name && children == other_node.children
    end
  end

  class RootNode < Node; end
  class VariablesNode < Node; end
  class PreconditionsNode < Node; end
  class CleanupNode < Node; end
  class ScriptNode < Node; end
  class AssignmentNode < Node; end
  class StepNode < Node; end

  class TestCaseNode < Node

    def initialize(name='', children={})
      unless children.class == Hash
        raise "Second parameter must be a Hash"
      end

      children[:variables]     = children.delete(:variables) || VariablesNode.new
      children[:preconditions] = children.delete(:preconditions) || PreconditionsNode.new
      children[:cleanup]       = children.delete(:cleanup) || CleanupNode.new
      children[:script]        = children.delete(:script) || ScriptNode.new

      super name, children
    end

    def ==(other_node)
      self.class       == other_node.class &&
      name             == other_node.name &&
      variables        == other_node.variables &&
      preconditions    == other_node.preconditions &&
      cleanup          == other_node.cleanup &&
      script           == other_node.script
    end

    def variables
      children[:variables]
    end

    def preconditions
      children[:preconditions]
    end

    def cleanup
      children[:cleanup]
    end

    def script
      children[:script]
    end
  end

end
