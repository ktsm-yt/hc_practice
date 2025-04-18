require_relative 'suica'

#1:Suicaクラス
class Suica
  attr_reader :charge
  #デポジット(チャージと同様として処理) 500円
  def initialize(initial_charge = 500)
    @charge = initial_charge
  end
  
  #現在のチャージ残高の取得機能 && 外部連携
  # def charge
  #    @charge
  # end

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