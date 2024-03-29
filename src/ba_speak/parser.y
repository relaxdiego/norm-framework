class BaSpeak::Parser

  token GROUP
  token REQUIREMENT
  token TEXT
  token ROW
  token CELL

  rule
    Root:
      /* empty array */           { result = RootNode.new }
    | Groups                      { result = RootNode.new('', val[0]) }
    ;

    Groups:
      GROUP                       { result = [ GroupNode.new(val[0]) ] }
    | GROUP Groups                { result = [ GroupNode.new(val[0]) ] + val[1] }
    | GROUP Requirements          { result = [ GroupNode.new(val[0], val[1]) ] }
    | GROUP Requirements Groups   { result = [ GroupNode.new(val[0], val[1]) ] + val[2] }
    ;

    Requirements:
      REQUIREMENT                              { result = [ RequirementNode.new(val[0]) ] }
    | REQUIREMENT RequirementBody              { result = [ RequirementNode.new(val[0], val[1]) ] }
    | REQUIREMENT RequirementBody Requirements { result = [ RequirementNode.new(val[0], val[1]) ] + val[2] }
    ;

    RequirementBody:
      Text                       { result = val[0] }
    | Table                      { result = val[0] }
    | Text Table                 { result = val[0] + val[1] }
    | Text Table Text            { result = val[0] + val[1] + val[2] }
    ;

    Text:
      TEXT                        { result = [] }
    ;

    Table:
      Rows                        { result = [ ExamplesNode.new('', val[0]) ] }
    ;

    Rows:
      ROW Cells                   { result = [ RowNode.new('', val[1]) ] }
    | ROW Cells Rows              { result = [ RowNode.new('', val[1]) ] + val[2] }
    ;

    Cells:
      CELL                        { result = [ val[0] ] }
    | CELL Cells                  { result = [ val[0] ] + val[1] }
    ;

end
---- header
  require 'ba_speak/lexer'
  require 'ba_speak/nodes'

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end