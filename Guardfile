guard 'rake', :task => 'ba_speak_lexer' do
  watch %r{^src/ba_speak/lexer\.rl$}
end

guard 'rake', :task => 'ba_speak_parser' do
  watch %r{^src/ba_speak/parser\.y$}
end

guard 'minitest' do
  watch(%r{^test/(.+)/(.+)_spec\.rb})
  watch(%r{^test/spec_helper\.rb})      { "test" }
  watch(%r{^lib/ba_speak/lexer\.rb})    { "test/ba_speak/lexer_spec.rb" }
  watch(%r{^lib/ba_speak/(parser|nodes?)\.rb})   { "test/ba_speak/parser_spec.rb" }
end