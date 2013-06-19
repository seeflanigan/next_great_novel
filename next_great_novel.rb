# A conversation at the Help Desk of RainyConf in which the
# helpdesk volunteer was given the helpdesk request:
# 'how to write the next great novel'
# suggestions that it should include archetypes from modern popular
# fiction
# eventual decision that an Undead superclass could ultimately be
# extracted from Zombie and Vampire.

require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'

class Human
  attr_reader :life

  def initialize
    @life = 100
  end

  def give_life!
    @life - 1
  end
end

class Vampire
  def feed!(prey)
    life += prey.give_life!
  end
end

class HumanTest < MiniTest::Unit::TestCase
  describe Human do
    it 'begins with 100 life' do
      Human.new.life.must_equal 100
    end

    it 'dies at 0 life' do
      human = Human.new
      human.life.times {|h| human.give_life! }
      human.dead?.must_equal true
    end

    it 'gives life' do
      human = Human.new
      human.give_life!
      human.life.must_equal 99
    end
  end
end

class VampireTest < MiniTest::Unit::TestCase
  describe Vampire do
    it 'takes life' do
      human = Human.new
      vampire = Vampire.new
      vampire.feed!(human)
      # must change by one? find a better assertion
      vampire.life.must_equal 1
    end

    it 'regenerates as it feeds' do
      prey = MiniTest::Mock.new
      vampire.feed!(prey)
      vampire.life.must_equal 1
    end
  end
end



# class NextGreatAmericanNovelTest < MiniTest::Unit::TestCase
# 
# end
# class NextGreatAmericanNovel::Vampire
#   describe Vampire do
#     describe "#drink_blood!" do
#       it "drinks blood" do 
#         vampire = Vampire.new 
#         human = Human.new
#         # human should have 100% (pints?) blood
# 
#         vampire.feed!(human)
# 
#         # human should have -50 blood
# 
#       end
#     end
#   end
# end
# 
# 
#   monster_klass = [Zombie, Werewolf, Mummy]
#   monster = monster_klass.new
# 
#   human = Human.new
# 
#   monster.attack!(human)
# 
#   monster.feed!(human)
# 
# 
# 
# class NextGreatAmericanNovel
#   # the next great american novel should contain some combination
#   # of the following:
#   #  - zombies
#   #  - shirtless werewolves
#   #  - vampires
# #
# #  module Monster
# #    def replicate!
# #      bite!
# #    end
# #  end
# #
# #  class Undead
# #
# #    def attack!
# #      # no op
# #    end
# #
# #    def feed!
# #      # no op
# #    end
# #
# #    def vanquish!
# #      # no op
# #    end
# #
# #  end
# #
# #  class Vampire < Undead
# #    include Monster
# #
# #    def drink_blood!
# #    end
# #  end
# #
# #  class Zombie < Undead
# #    include Monster
# #
# #    def eat_brains!
# #    end
# #  end
# #
# #
# #  class Werewolf
# #    include Monster
# #    attr_reader :shirt
# #
# #    def eat_heart!
# #    end
# #
# #    def go_sexy!
# #      # Consider adding different shirt removal avenues 
# #      shirt.remove!
# #    end
# #  end
# #
# #  class Mummy < Undead
# #  end
# end
