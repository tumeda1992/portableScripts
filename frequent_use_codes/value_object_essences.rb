# 単なる数字や文字列に意味を持たせたいときの値オブジェクトでの元の値の出力方法
class Age
  def initialize(age)
    @age = age
  end

  def senior?
    @age >= 65
  end

  # うーん。。。
  # age = Age.new(25); p age.age
  attr_reader :age

  # ↓

  # age = Age.new(25); p age.to_i
  # 文字列ならto_s
  def to_i
    @age
  end

  # age = Age.new(25); p age.value
  def value
    @age
  end
end