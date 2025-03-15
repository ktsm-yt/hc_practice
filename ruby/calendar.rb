# macに入っているcalコマンドと同じ見た目になっていること
# ※ calコマンドは日曜始まりになっていますが、今回は月曜始まりで実装すること
# Gemは使わないこと
# Rubyの標準ライブラリは使用可能
# -mオプションで月を指定できるようにすること。今年が2022年なら cal -m 6で2022年6月のカレンダーになる。
# 引数を指定しない場合は、今月・今年のカレンダーが表示される
# -mの引数が不正な月の場合は次のエラーを出すこと
# ruby calendar.rb -m 22
# 22 is neither a month number (1..12) nor a name"

# ・前提
# dateのインポート
require 'date'
# octparseのインポート
require 'optparse'

# ・コード
# 当月・年の表示
today = Date.today
puts "      " + "#{today.month}月 #{today.year}"
#一桁月の0表記を除くコードは煩雑

# 月曜始まりで羅列
puts "月 火 水 木 金 土 日"

# 最初の日、最後の日を取得
firstday = Date.new(today.year, today.month, 1)
lastday = Date.new(today.year, today.month, -1)

# 最初の日の曜日を取得
weekday = firstday.wday + 1
print "  " * weekday + " "

# 月初から月末までの羅列
(firstday..lastday).each do |day|
  # 日付を右詰めするため、文字列に変換してrjust
  print day.day.to_s.rjust(2," ") + " "
  # 7つ目(日曜)で区切る
    if day.wday == 0
    puts 
  end
end


# ・装飾
# 当日の文字色・背景を反転(応用))
# print "\e[30today\e[0m"
# print "\e[47today\e[0m"

# ・オプション指定
# -mでオプションを出す
