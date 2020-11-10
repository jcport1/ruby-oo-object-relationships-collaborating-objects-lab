class Artist

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
  

    end 

    def self.all
        @@all
    end 

    def add_song(song)
        
        song.artist = self #set the song as beloning to the instance 
    end 

    def songs

        Song.all.select do |song|
            song.artist == self
        end 
    end 

    def self.find_or_create_by_name(artist_name)

        self.all.find {|artist| #searchs for the artist_name
        artist.name = artist_name} ||
        self.new(artist_name) #creates a new instance of the artist

    end 

    def print_songs

        self.songs.collect {|song| 
        puts song.name}
    end 

end 