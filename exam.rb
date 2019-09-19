require 'webrick'

module WEBrick
  module HTTPServlet
    FileHandler.add_handler('rb', CGIHandler)
  end
end

server = WEBrick::HTTPServer.new({
  # このWebアプリケーションのドメインの設定
  #（ここに書き込まれた記述が、作成するWebアプリケーションのドメインになる）
  :DocumentRoot => '.',
  # このプログラムを実行（翻訳）できるプログラム（Rubyのこと）本体の居場所を指定する記述。
  # '/usr/local/rvm/rubies/ruby-2.3.4/bin/ruby'とすることで、
  # システムに入っているRubyの本体を指定して、プログラムを実行できる
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  # このWebアプリケーションの情報の出入り口を表す設定
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')

server.mount('/exam_result1.cgi', WEBrick::HTTPServlet::CGIHandler, 'exam_result1.rb')
server.mount('/exam_result2.cgi', WEBrick::HTTPServlet::CGIHandler, 'exam_result2.rb')

server.start
