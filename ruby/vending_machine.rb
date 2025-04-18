# vending_machine 
# 相対パスで指定
require_relative 'juice'
require_relative 'suica'

#2:自販機クラス
class VendingMachine
  # attr_reader :sales
  def initialize(sales = 0)
    @sales = sales #売上
    # ジュース管理を3つに
    @juices = [
      Juice.new('ペプシ', 150),
      Juice.new('モンスター', 230),
      Juice.new('いろはす', 120)
    ]
    #stockを足す方法が必要だ
    @stock = {}
    #@stockに対して,juicesのnameをキーとした在庫の指定
    @juices.each{|juice| @stock[juice.name] = 5}
  end
  # 自販機に売上取得機能 && 外部連携
  def sales
    @sales
  end
  #juice不要

  # 自販機クラスにリスト機能を追加
  def sell_list
    @juices.map(&:name)
  end

  #3:販売処理 モンスターといろはすの購入追加
  #4:機能拡張
  def sell_juice(suica, juice_name)
    # 配列処理ブロック
    find_juice = find_juice_by_name(juice_name)

    #Suica残高とジュース値段の条件検証 & 例外処理
    raise ArgumentError, 'チャージ残高が足りません' if find_juice.price > suica.balance
    raise ArgumentError, '在庫がありません' if @stock[juice_name] < 1

    @stock[juice_name] -= 1    # 自販機の在庫 -
    @sales += find_juice.price   # 売上 +
    suica.pay(find_juice.price)  # Suicaチャージ -
  end

  # 在庫補充のメソッド
  def restock_juice(juice_name, quantity)
    find_juice = find_juice_by_name(juice_name)
    @stock[juice_name] += quantity
  end

  #在庫取得機能 
  def check_stock(juice_name)
    @find_juice = find_juice_by_name(juice_name)
    @stock[juice_name]
  end

  #ロジックを一箇所にまとめるリファクタリング
  private
  
  def find_juice_by_name(juice_name)
    @juices.find {|j| j.name == juice_name}
  end
end


# # #動作確認
# suica = Suica.new
# vm = VendingMachine.new

# puts vm.sell_list
# puts vm.restock_juice('モンスター', 3)

# suica.charge(500)

# puts suica.balance
# # suica.charge(50)
# puts vm.sell_juice(suica,'モンスター')
# puts suica.balance
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.balance
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.balance
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.balance
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.balance
# puts vm.check_stock('モンスター')
# puts vm.sales

