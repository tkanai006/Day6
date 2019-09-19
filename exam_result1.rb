# データを受け取り、返却するCGIプログラムの起動
require 'cgi'
cgi = CGI.new

# データを受け取った後、HTMLの形式でレスポンスを返す
cgi.out("type" => "text/html", "charset" => "UTF-8") {
  get = cgi['exam_result1']

  # HTMLでレスポンスを返却する
  "<html>
    <body>
      <p>譲渡先が「自家消費ではない」もののgoyaの情報は下記になります。</p>
        #{get}
    </body>
  </html>"
}
