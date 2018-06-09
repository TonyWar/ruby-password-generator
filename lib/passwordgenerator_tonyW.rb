require "passwordgenerator_tonyW/version"

module PasswordgeneratorTonyW
  module CharacterSets
    # похожие друг на друга символы
    lookALike  = "Ss5Bb8|Iio01lO".split(//)
    # Символы, подходящие для добавления в пароль
    safeChars  = ("A".."Z").to_a | ("a".."z").to_a | ("0".."9").to_a | "-_.,;+!*()[]{}|~^<>\"'$=".split(//)
    visualSafe = safeChars - lookALike
    # Согласные
    CONSONANTS = %w( b c d f g h j k l m n p r s t v w x z ch sh sw wr dg th ph wh) - visualSafe
    # Сочетания согласных
    CONSONANTS2 = %w(ch sh sw wr dg th ph wh)
    # Гласные
    VOWELS     = %w( a e i o u y ) - visualSafe
    # Сочетание гласных
    VOWELS2   = %w( oo ou ai oi oy ee )
  end
  
  class PasswordGenerator
    include CharacterSets
  
    def initialize()
      @password = ""
    end
  
    def generatePassword(length)
      start = rand > 0.5
  
      while @password.size < length
        start = !start
        if length - @password.size > 1
          if start
            set = rand > 0.5
            @password << (set ? getVowel() : getVowel2())
          else
            set = rand > 0.5
            @password << (set ? getConsonant() : getConsonant2())
          end
        else
          if start
            @password << getVowel()
          else
            @password << getConsonant()
          end
        end
      end
      @password
    end
  
    def getVowel()
      CharacterSets::VOWELS.sample
    end
  
    def getVowel2()
      CharacterSets::VOWELS2.sample
    end
  
    def getConsonant()
      CharacterSets::CONSONANTS.sample
    end
  
    def getConsonant2()
      CharacterSets::CONSONANTS2.sample
    end
  
    def chooseSymbol()
      set = rand > 0.5
      set ? CharacterSets::CONSONANTS.sample : CharacterSets::VOWELS.sample
    end
  end
end
