# vending_machine

# クラスのインスタンスメソッド内で標準入力を受け取るコードを書かないようにしてください。
# 値を受け取りたい場合はメソッドの引数などで渡すようにしてください。
# クラスのインスタンスメソッド内で標準出力するコードを書かないようにしてください。
# 標準出力に出す必要はなく、値を返すメソッドを実装するだけでOKです。

#1:Suicaクラス
class Suica
  #デポジット(チャージと同様として処理) 500円
  def initialize(initial_charge = 500)
    @charge = initial_charge
  end
  
  #現在のチャージ残高を取得する機能 && 外部利用
  def charge
    return @charge
  end

  #チャージ機能
  def add_charge(amount)
    #100<ならエラー #? エラーでいいの?ターミナルで止まっちゃう
    raise ArgumentError puts '100円以上の金額を入金してください' if amount < 100
    @charge += amount
  end
end

# # 動作確認 
suica = Suica.new
puts suica.charge
suica_charge = suica.charge
# puts suica.add_charge(500)
# puts suica.add_charge(50)
# puts suica.check_charge

# puts 'チャージ金額を入力してください'
# amount = gets.chomp.to_i

#2:ジュース管理クラス(自販機)
class VendingMachine
  attr_accessor :name, :price, :stock #! 後でメソッドに
  # インナークラス
  class Juice
    # 初期状態 でジュースを1種格納
    # 名前,値段,在庫の情報ハッシュ管理
    def initialize(name = 'ペプシ', price = 150, stock = 5)
      @info = {name: name, price: price, stock: stock}
      @name = @info[:name]
      @price = @info[:price]
      @stock = @info[:stock]
    end
    # 最終的には配列にしたい
    def info
      @info
    end
    def name
      @name
    end
    def price
      @price
    end
    def stock
      @stock
    end
    def stock= stock
      @stock
    end
  end
  #インナークラス生成メソッド 
  def initialize(sales = 0)
    @juice = Juice.new
    @sales = sales #売上
  end
   #クラス外でjuiceを取得
  def juice
    @juice
  end

  def sales
    @sales
  end
  
  def sell_juice(suica_charge)
    balance = suica_charge - @juice.price #最終的に[:name][;price]にしたい
    @juice.stock -= 1      # 自販機の在庫 -
    @sales += @juice.price   # 売上 +
    @charge = balance      # Suicaチャージ -
    
    #自販機に販売できるか追加validation
    #Suica残高とジュース値段の条件検証 & 例外処理
    raise ArgumentError puts 'チャージ残高が足りません' if balance < 0
    raise ArgumentError puts '在庫がありません' if @juice.stock < 1
    
  end

  #在庫取得機能 
  def check_stock
    @juice.info[:stock]
  end 
end

# # #動作確認
vm =VendingMachine.new

# puts vm.juice.name
# puts vm.juice.price
# puts vm.juice.stock
# puts vm.check_stock

puts vm.sell_juice(suica_charge)
puts suica.charge
puts vm.juice.stock
puts vm.sales
puts vm.sell_juice(suica_charge)
puts suica.charge
puts vm.juice.stock
puts vm.sales

#3:販売処理
 
  # 自販機に売上取得機能


#4機能拡張
# ジュース管理を3つに
  # [{}]ハッシュの格納された配列に。
  # {name: 'モンスター', price: 230, stock: 5}
  # {name: 'いろはす', price: 120, stock: 5}
  # 配列処理ブロックの追加
# 自販機クラスにリスト機能を追加
# 在庫補充のメソッド [:stock]
# モンスターといろはすの購入