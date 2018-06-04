module CharacterSets
  # похожие друг на друга символы
  lookALike  = "Ss5Bb8|Iio01lO".split(//)
  # Символы, подходящие для добавления в пароль
  safeChars  = ("A".."Z").to_a | ("a".."z").to_a | ("0".."9").to_a | "-_.,;+!*()[]{}|~^<>\"'$=".split(//)
  visualSafe = safeChars - lookALike
  # Согласные
  CONSONANTS = %w( b c d f g h j k l m n p r s t v w x z ) - visualSafe
  # Гласные
  VOWELS     = %w( a e i o u y ) - visualSafe
end

class PasswordGenerator
  include CharacterSets

  def initialize()
    @length = (8..12).to_a.sample
    @password = ""
  end

  def generatePassword()
    while @password.size < @length
      @password << chooseSymbol()
    end
    @password
  end

  def chooseSymbol()
    set = rand > 0.5
    set ? CharacterSets::CONSONANTS.sample : CharacterSets::VOWELS.sample
  end
end

a = PasswordGenerator.new()
puts("Your new password: #{a.generatePassword()}")