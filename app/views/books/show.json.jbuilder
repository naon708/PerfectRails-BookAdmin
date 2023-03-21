# カラムを指定して返す
json.extract! @book, :id, :name, :price

# JSONのKeyを定義できる
json.name_with_id "ID:#{@book.id} - #{@book.name}"

# ネストを表現できる
json.publisher do
  json.name @book.publisher.name
  json.address @book.publisher.address
  json.message_from_office "#{@book.publisher.address}に会社があるよ"
end

# if文とかも使える
unless @book.high_price?
  json.low_price true
end

# 引数にEnumerableなオブジェクトを渡すと、JSONの配列に展開してくれる
json.books Book.all do |book|
  json.extract! book, :id, :name, :price
end

