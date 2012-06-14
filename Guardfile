guard 'rake', :task => 'ba_speak:lexer' do
  watch %r{^src/ba_speak/lexer\.rl$}
end

guard 'rake', :task => 'ba_speak:parser' do
  watch %r{^src/ba_speak/parser\.y$}
end

guard 'rake', :task => 'qa_speak:lexer' do
  watch %r{^src/qa_speak/lexer\.rl$}
end

guard 'rake', :task => 'qa_speak:parser' do
  watch %r{^src/qa_speak/parser\.y$}
end

guard 'minitest' do
  watch(%r{^test/(.+)/(.+)_spec\.rb})
  watch(%r{^test/spec_helper\.rb})               { "test" }
  watch(%r{^lib/ba_speak/lexer\.rb})             { "test/ba_speak/lexer_spec.rb" }
  watch(%r{^lib/ba_speak/(parser|nodes?)\.rb})   { "test/ba_speak/parser_spec.rb" }
  watch(%r{^lib/ba_speak/nodes\.rb})             { "test/ba_speak/requirement_node_spec.rb" }

  watch(%r{^lib/qa_speak/lexer\.rb})             { "test/qa_speak/lexer_spec.rb" }
  watch(%r{^lib/qa_speak/parser\.rb})            { "test/qa_speak/parser_spec.rb" }
  watch(%r{^lib/qa_speak/nodes\.rb})             { "test/qa_speak/test_case_node_spec.rb" }
end