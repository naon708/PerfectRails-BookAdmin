# README

### Versions
Ruby: 2.6.6, 
Rails: 6.0.3, 
sqlite3: 1.4, 
webpacker: 4.2.2

### コントローラーのフック
- before_action
- after_action(正常にActionが実行された場合のみ呼び出される)
- around_action(指定したメソッド内にyieldの記述が必要)
- skip_*_action(フックのスキップ)

### renderメソッドのオプション(formatの種類)
:plain, :html, :body, :template, :file, :inline, :json, :xml 



### Memo
- jbuilderとGraphQLって役割とかI/Oが似てる気がする
