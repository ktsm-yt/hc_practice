# vending_machine 
# 相対パスで指定
require_relative './juice'
require_relative './suica'

#2:自販機クラス
class VendingMachine
  # attr_reader :sales
  def initialize(initial_sales = 0)
    @sales = initial_sales
    @juices = {}
    @stocks = {}
    setup_initial_juices
  end

  def setup_initial_juices
    add_juice(Juice.new('ペプシ', 150), 5)
    add_juice(Juice.new('モンスター', 230), 5)
    add_juice(Juice.new('いろはす', 120), 5)
  end

  # ジュース名をキーとするハッシュ
  def add_juice(juice, initial_stock)
    @juices[juice.name] = juice
    @stocks[juice.name] = initial_stock
  end
  # 自販機に売上取得機能 && 外部連携
  def sales
    @sales
  end
 
  # 自販機クラスにリスト機能を追加
  def sell_list
    @juices.keys
  end

  #3:販売処理 #4:機能拡張
  def sell(suica, name)
    #Suica残高とジュース値段の条件検証 & 例外処理
    juice = @juices[name]
    raise ArgumentError, '指定された商品は存在しません' unless juice
    raise ArgumentError, 'チャージ残高が足りません' if juice.price > suica.balance
    raise ArgumentError, '在庫がありません' if @stocks[name] < 1

    @stocks[name] -= 1    # 自販機の在庫 -
    @sales += juice.price   # 売上 +
    suica.pay(juice.price) # Suicaチャージ -
  end

  # 在庫補充のメソッド
  def restock(name, quantity)
    return false unless @juices[name]
    @stocks[name] += quantity
  end

  #在庫取得機能 
  def check_stock(name)
    return 0 unless @juices[name]
    @stocks[name]
  end
end

# 動作確認
suica = Suica.new
vm = VendingMachine.new

puts vm.sell_list
puts vm.check_stock('ペプシ')

suica = Suica.new
suica.charge(1000)
vm.sell(suica, 'ペプシ')

puts vm.sales

vm.restock('ペプシ', 3)
puts vm.check_stock('ペプシ')

