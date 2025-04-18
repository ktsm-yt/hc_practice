# ジュースクラス
class Juice
  attr_writer :stock
  attr_reader :name, :price, :stock
  # 名前,値段,在庫の情報
  def initialize(name = 'ペプシ', price = 150, stock = 5)
    @name = name
    @price = price
    @stock = stock
  end
end
