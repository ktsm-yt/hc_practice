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
     @charge
  end

  #チャージ機能
  def add_charge(amount)
    #100<ならエラー #? エラーでいいの?ターミナルで止まっちゃう
    raise ArgumentError, '100円以上の金額を入金してください' if amount < 100
    @charge += amount
  end
  #自販機クラスと連携
  def decrease_charge(amount)
    @charge -= amount
  end
end


#2:自販機クラス
class VendingMachine
  # 初期状態 でジュースを1種格納
  def initialize(sales = 0)
    @sales = sales #売上
    #クラス内でインスタンスを作れば利用可
    @juice = Juice.new('ペプシ', 150, 5) 
  end

  def sales
    @sales
  end
  def juice
    @juice
  end
  
  def sell_juice(suica)
    balance = suica.charge - @juice.price #最終的に[:name][;price]にしたい
    @juice.stock -= 1      # 自販機の在庫 -
    @sales += @juice.price   # 売上 +
    suica.decrease_charge(@juice.price)      # Suicaチャージ -
    
    #自販機に販売できるか追加validation
    #Suica残高とジュース値段の条件検証 & 例外処理
    raise ArgumentError, 'チャージ残高が足りません' if balance < 0
    raise ArgumentError, '在庫がありません' if @juice.stock < 1
  end

  #在庫取得機能 
  def check_stock
    @juice.stock
  end 
end

# ジュースクラス
class Juice
  # 名前,値段,在庫の情報 ハッシュ管理は余計なので廃止
  def initialize(name = 'ペプシ', price = 150, stock = 5)
    @name = name
    @price = price
    @stock = stock
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
  #セッターの正しい書き方
  def stock=(new_stock)
    @stock = new_stock
  end
end

#動作確認
suica = Suica.new
vm = VendingMachine.new

suica.add_charge(500)
# suica.add_charge(50)
puts vm.sell_juice(suica)
puts suica.charge
puts vm.juice.stock
puts vm.sales
puts vm.sell_juice(suica)
puts suica.charge
puts vm.juice.stock
puts vm.sales
puts vm.sell_juice(suica)
puts suica.charge
puts vm.juice.stock
puts vm.sales
puts vm.sell_juice(suica)
puts suica.charge
puts vm.juice.stock
puts vm.sales
puts vm.sell_juice(suica)
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