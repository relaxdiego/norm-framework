desc "Compiles the lexer"
task :ba_speak_lexer do |t|
  `ragel -R src/ba_speak/lexer.rl -o lib/norm_framework/ba_speak/lexer.rb`
end

desc "Compiles the parser"
task :ba_speak_parser do |t|
  `racc src/ba_speak/parser.y -o lib/norm_framework/ba_speak/parser.rb`
end