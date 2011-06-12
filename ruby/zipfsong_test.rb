require 'test/unit'
require 'zipfsong'

class TestZipfSong < Test::Unit::TestCase

  def setup
    @sut = ZipfSong.new  
  end 
  
  def test_two_popular_songs
    input = '4 2
      30 one
      30 two
      15 three
      25 four'
    assert_equal(['four', 'two'], @sut.popular_songs(input))
  end
  
  def test_three_popular_songs
    input = '15 3
    197812 re_hash
    78906 5_4
    189518 tomorrow_comes_today
    39453 new_genious
    210492 clint_eastwood
    26302 man_research
    22544 punk
    19727 sound_check
    17535 double_bass
    18782 rock_the_house
    198189 19_2000
    13151 latin_simone
    12139 starshine
    11272 slow_country
    10521 m1_a1'
    assert_equal(['19_2000', 'clint_eastwood', 'tomorrow_comes_today'], @sut.popular_songs(input))
  end
  
  def test_prefer_earlier_song_on_equal_frequency
    input = '4 2
      30 one
      30 two
      15 three
      25 four
      20 five' 
    assert_equal(['four', 'five'], @sut.popular_songs(input))
  end
  
  def test_songs_already_sorted
    input = '4 2
      99 one
      40 two
      3 three
      2 four
      1 five' 
    assert_equal(['one', 'two'], @sut.popular_songs(input))
  end
  
end

