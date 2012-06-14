require 'singleton'

module NormFramework

  class Steps
    include Singleton

    def self.add(pattern, &block)
      instance.add pattern, &block
    end

    def self.call(pattern)
      instance.call pattern
    end

    attr_reader :steps

    def initialize
      @steps = []
    end

    def add(pattern, &block)
      steps << { pattern: pattern, block: block }
    end

    def call(pattern)
      vars = nil
      step = steps.find { |s| vars = s[:pattern].match(pattern) }

      raise "Undefined step '#{ pattern }'" unless step

      if vars.length > 1
        step[:block].call(*vars[1..-1])
      else
        step[:block].call
      end
    end

  end


  def step(pattern, &block)
    Steps.add pattern, &block
  end

end