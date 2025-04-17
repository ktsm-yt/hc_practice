# vending_machine

#1:Suicaクラス
class Suica
  #デポジット(チャージと同様として処理) 500円
  def initialize(initial_charge = 500)
    @charge = initial_charge
  end
  
  #現在のチャージ残高の取得機能 && 外部連携
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
  def initialize(sales = 0)
    @sales = sales #売上
    # ジュース管理を3つに
    @juices = [
      Juice.new('ペプシ', 150, 5),
      Juice.new('モンスター', 230, 5),
      Juice.new('いろはす', 120, 5)
    ]
  end
  # 自販機に売上取得機能 && 外部連携
  def sales
    @sales
  end
  def juice
    @juice
  end

  # 自販機クラスにリスト機能を追加
  def sell_list
    @juices.map(&:name)
  end

  #3:販売処理 モンスターといろはすの購入追加
  #4:機能拡張
  def sell_juice(suica, juice_name)
    # 配列処理ブロック
    find_juice = find_juice_by_name(juice_name)
    balance = suica.charge - find_juice.price

    #Suica残高とジュース値段の条件検証 & 例外処理
    raise ArgumentError, 'チャージ残高が足りません' if balance < 0
    raise ArgumentError, '在庫がありません' if find_juice.stock < 1

    find_juice.stock -= 1    # 自販機の在庫 -
    @sales += find_juice.price   # 売上 +
    suica.decrease_charge(find_juice.price)  # Suicaチャージ -
  end

  # 在庫補充のメソッド
  def restock_juice(juice_name, quantity)
    find_juice = find_juice_by_name(juice_name)
    find_juice.stock += quantity
  end

  #在庫取得機能 
  def check_stock(juice_name)
    @find_juice = find_juice_by_name(juice_name)
    @find_juice.stock
  end

  #ロジックを一箇所にまとめるリファクタリング
  private
  
  def find_juice_by_name(juice_name)
    @juices.find {|j| j.name == juice_name}
  end
end

# ジュースクラス
class Juice
  # 名前,値段,在庫の情報
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
  
  def stock=(new_stock)
    @stock = new_stock
  end
end


#動作確認
# suica = Suica.new
# vm = VendingMachine.new

# puts vm.sell_list
# puts vm.restock_juice('モンスター', 3)

# suica.add_charge(500)

# puts suica.charge
# # suica.add_charge(50)
# puts vm.sell_juice(suica,'モンスター')
# puts suica.charge
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.charge
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.charge
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.charge
# puts vm.check_stock('モンスター')
# puts vm.sales
# puts vm.sell_juice(suica,'モンスター')
# puts suica.charge
# puts vm.check_stock('モンスター')
# puts vm.sales






