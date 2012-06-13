=begin
%%{

  machine lexer;

  newline       = ('\n' | '\r\n');
  string        = [A-Za-z0-9]print*;
  req_string    = [A-Za-z0-9<]print*;
  underline     = [=][=][=][=]*;
  tab_or_space  = [\t ];

  group_name  = string tab_or_space* newline tab_or_space* underline;
  text        = string tab_or_space* (newline tab_or_space* string)* (newline newline)*;
  requirement = '* ' req_string tab_or_space* (newline tab_or_space* req_string)* (newline newline)*;
  table_row   = '|'print*'|';

  main := |*

    group_name  => { emit_group_name(token_array, data, ts, te)  };
    requirement => { emit_requirement(token_array, data, ts, te) };
    table_row   => { emit_row(data, token_array, ts, te) };
    text        => { emit_text(token_array, data, ts, te) };

    space;

  *|;
}%%
=end

module BaSpeak

  class Lexer

    def initialize
      %% write data;
      # %% this just fixes syntax highlighting in TextMate et al.
    end

    def emit_group_name(token_array, data, ts, te)
      value = data[ts...te].pack("c*").split(/=+/)[0].strip
      token_array << [:GROUP, value]
    end

    def emit_row(data, target_array, ts, te)
      target_array << [:ROW, 'Row']
      cells = data[(ts + 1)...( te - 1)].pack("c*")
      cells.split('|').each do |cell|
        target_array << [:CELL, cell.strip]
      end
    end

    def emit_requirement(token_array, data, ts, te)
      value = data[ts...te].pack("c*").gsub(/^\* /, '').split.join(' ')
      token_array << [:REQUIREMENT, value]
    end

    def emit_text(token_array, data, ts, te)
      value = data[ts...te].pack("c*").strip.split.join(' ')
      token_array << [:TEXT, value]
    end

    def tokenize(data)
      data = data.unpack("c*") if(data.is_a?(String))
      eof = data.length
      token_array = []

      %% write init;
      %% write exec;

      token_array
    end

  end

end