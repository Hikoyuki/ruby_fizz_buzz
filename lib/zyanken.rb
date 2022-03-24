puts "何本勝負？(press 1 or 3 or 5)"
fight = gets.chomp

# case game
# when "1"
#   puts "#{game}本勝負を選びました"
# when "3"
#   puts "#{game}本勝負を選びました"
# when "5"
#   puts "#{game}本勝負を選びました"
# else
#   puts "正しい数字を選んでください"
# end

win  = 0
lose = 0
next_game = true

puts "#{fight}本勝負を選びました"

fight.to_i.times do |fight|

  puts "#{fight+1}本目"
  next_game = true

  while next_game
    puts "じゃんけん…(press g or c or p)"

    you = gets.chomp
    cpu = ["g", "c", "p"].sample

    jankens = {g: "グー",  c: "チョキ", p: "パー"}

    puts "CPU…#{jankens[:"#{cpu}"]}"
    puts "あなた…#{jankens[:"#{you}"]}"

    if jankens[:"#{cpu}"] == jankens[:"#{you}"] #あいこの条件
      puts "あいこ！"
      next_game = true

    elsif (jankens[:"#{cpu}"] == "グー" && jankens[:"#{you}"] == "パー") || (jankens[:"#{cpu}"] == "パー" && jankens[:"#{you}"] == "チョキ") || (jankens[:"#{cpu}"] == "チョキ" && jankens[:"#{you}"] == "グー") #勝ちの条件
      puts "あなたの勝ちです"
      win += 1
      next_game = false

    else
      puts "あなたの負けです"
      lose += 1
      next_game = false
    end
  end
end

puts "結果"
puts "#{win}勝#{lose}敗"
