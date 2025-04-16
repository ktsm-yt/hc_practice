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
  
  def charge
    @charge
  end
  #チャージ機能
  def add_charge(amount)
    if amount < 100 #100<ならエラー
      raise ArgumentError, '100円以上の金額を入金してください'
      # エラーでいいの?ターミナルで止まっちゃう
    end
    @charge += amount
  end

  #現在のチャージ残高を取得する機能
  def check_charge
    @charge
  end
end

# # 動作確認 
# suica = Suica.new
# puts suica.add_charge(500)
# puts suica.add_charge(50)
# puts suica.check_charge

# puts 'チャージ金額を入力してください'
# amount = gets.chomp.to_i

#2:ジュース管理クラス(自販機)
class VendingMachine
  # インナークラス
  class Juice
    # 初期状態 でジュースを1種格納
    # 名前,値段,在庫の情報ハッシュ管理
    def initialize(name = 'ペプシ', price = 150, stock = 5)
      @info = {name: name, price: price, stock: stock}
    end
    # 最終的には配列にしたい
    def info
      @info
    end
  end

  def initialize
    @juice = Juice.new
  end
  #インナークラス生成メソッド
  #initializeに統合
  def juice
    @juice
  end
  #在庫取得機能 
  def check_stock 
    @juice.info[:stock]
  end 
end

# # #動作確認
# vm =VendingMachine.new

# puts vm.juice.info[:name]
# puts vm.juice.info[:price]
# puts vm.juice.info[:stock]
# puts vm.check_stock



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
# 自販機クラスにリスト機能を追加
# 在庫補充のメソッド [:stock]
# モンスターといろはすの購入