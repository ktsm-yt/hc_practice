require_relative 'suica'

#1:Suicaクラス
class Suica
  # attr_reader :charge
  #デポジット(チャージと同様として処理) 500円
  def initialize(initial_charge = 500)
    @balance = initial_charge
  end
  
  #現在のチャージ残高の取得機能 && 外部連携
  def balance
     @balance
  end

  #チャージ機能
  def charge(amount)
    #100<ならエラー
    raise ArgumentError, '100円以上の金額を入金してください' if amount < 100
    @balance += amount
  end
  #自販機クラスと連携
  def pay(amount)
    @balance -= amount
  end
end