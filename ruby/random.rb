# 4.7.4 %記法で文字列の配列を作る。["A","B"...]",文字をタイプするのは非常に面倒くさい！
members = %w(A B C D E F)

#実行するごとに結果が変わる。
shuffled_members = members.shuffle

#グループを3人と3人、または2人と4人にランダムに分ける。
#2つのグループについて考えず、まず2人か3人のランダムグループを作る。
group = [2,3].sample
#非常にシンプル

#sampleメソッドに引数を当てる。
group1 = shuffled_members.sample(group)
group2 = shuffled_members - group1 #4.7.4 配列の差集合

#表示結果はアルファベット順

p group1.sort
p group2.sort


