# vending_machine

# クラスのインスタンスメソッド内で標準入力を受け取るコードを書かないようにしてください。
# 値を受け取りたい場合はメソッドの引数などで渡すようにしてください。
# クラスのインスタンスメソッド内で標準出力するコードを書かないようにしてください。
# 標準出力に出す必要はなく、値を返すメソッドを実装するだけでOKです。

#1:Suicaクラス
class Suica
  attr_reader :charge

  #デポジット(チャージと同様として処理) 500円
  def initialize(initial_charge = 500)
    @charge = initial_charge
  end
  
  #チャージ機能
  def add_charge(amount)
    if amount < 100 #100<ならエラー
      raise ArgumentError, '100円以上の金額を入金してください'
      # エラーでいいの?ターミナルで止まっちゃう
    end
    @charge += amount
    # puts "#{amount}円チャージしました"
    # puts "チャージ残高#{@charge}円 "
  end

  #現在のチャージ残高を取得する機能
  def check_charge
    @charge
    # puts "チャージ残高は#{@charge}円です"
  end
end

# 動作確認 
# suica = Suica.new
# suica.add_charge(500)
# suica.add_charge(50)
# suica.check_charge

# puts 'チャージ金額を入力してください'
# amount = gets.chomp.to_i

#2:ジュース管理クラス(自販機)
class VendingMachine
  attr_reader
  def initialize
  end
end

class Juice
  attr_reader :name :price :stock
  
  # 名前,値段,在庫の情報
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end

#ジュースを1種格納
juice = [{name: 'ペプシ', price: 150, sock: 5}]
#在庫取得機能

Juice.new()
#3:販売処理
  #自販機に販売できるか追加validation
  #Suica残高とジュース値段の条件検証 & 例外処理
    # 自販機の在庫 -
    # 売上 +
    # Suicaチャージ -
  # 自販機に売上取得機能


#4機能拡張
# ジュース管理を3つに
  {name: 'モンスター', price: 230, stock: 5}
  {name: 'いろはす', price: 120, stock: 5}
# 自販機クラスにリストを追加
# 在庫補充のメソッド [:stock]
# モンスターといろはすの購入