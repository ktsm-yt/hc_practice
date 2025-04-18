# ジュースクラス
class Juice
  # attr_reader :name, :price
  # 名前,値段の情報
  def initialize(name = 'ペプシ', price = 150)
    @name = name
    @price = price
  end

  def name
    @name
  end
  def price
    @price
  end

end
#stock管理は自販機なので情報を移す
#stock管理にジュースクラスが絡まず,よりシンプル