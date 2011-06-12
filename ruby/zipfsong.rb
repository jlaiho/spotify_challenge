class ZipfSong

  def initialize
    @song_data = []
    @num_of_songs = 0
  end

  def popular_songs(input)  
    parse_input(input)   
    apply_play_frequency_correction()    
    sort_by_popularity()
    output(@num_of_songs)    
  end
  
  protected

   #Zipf law
  def apply_play_frequency_correction
    @song_data.map! {|song| song[:plays] *= song[:index]; song }
  end

  #frequency desc, index asc
  def sort_by_popularity
    @song_data = @song_data.sort_by {|x| [-x[:plays], x[:index]] }
  end

  def output(num)
    @song_data.take(num).map {|hash| hash[:song] }
  end

  def parse_input(input)
    @song_data = []
    data = input.split("\n")
    total_songs, num_of_songs = data.shift.split(" ")
    data.each_with_index do |song_info, index|
      plays, name = song_info.split(" ")
      @song_data << {
        :song  => name, 
        :plays => plays.to_i, 
        :index => index + 1
      }
    end
    @num_of_songs = num_of_songs.to_i
  end

end

