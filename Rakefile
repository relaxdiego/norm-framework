namespace :ba_speak do

  desc "Compiles the BA Speak lexer"
  task :lexer do |t|
    `ragel -R src/ba_speak/lexer.rl -o lib/ba_speak/lexer.rb`
  end

  desc "Compiles the BA Speak parser"
  task :parser do |t|
    `racc src/ba_speak/parser.y -o lib/ba_speak/parser.rb`
  end

end

namespace :qa_speak do

  desc "Compiles the QA Speak lexer"
  task :lexer do |t|
    `ragel -R src/qa_speak/lexer.rl -o lib/qa_speak/lexer.rb`
  end

  desc "Compiles the QA Speak parser"
  task :parser do |t|
    `racc src/qa_speak/parser.y -o lib/qa_speak/parser.rb`
  end

end