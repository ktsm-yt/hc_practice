# 4.7.4 %記法で文字列の配列を作る。["A","B"...]",文字をタイプするのは非常に面倒くさい！
members = %w(A B C D E F)

#実行するごとに結果が変わる。
shuffled_members = members.shuffle

#グループを3人と3人、または2人と4人にランダムに分ける。
groups = [[3,3],[2,4]]
group = groups.sample
#ここまでで[3,3][2,4]のどちらかの配列になる。

#sampleメソッドに引数を当てる。
group1 = shuffled_members.sample(group[0])
group2 = shuffled_members - group1 #4.7.4 配列の差集合

#表示結果はアルファベット順

p group1.sort
p group2.sort


