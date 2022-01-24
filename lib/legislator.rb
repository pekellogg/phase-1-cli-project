class Legislator
    BASE = "https://api.propublica.org/congress/v1/117/senate/members.json"

    @@all = []
    
    def self.all
        @@all
    end

    # def initialize(name=nil, phone=nil, state=nil)
    #     @@all << self
    # end
end