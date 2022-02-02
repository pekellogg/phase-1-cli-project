class Vote
    
    BASE = "https://api.propublica.org/congress/v1/"

    @@all = []
    def self.all
        @@all
    end

    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        self.class.all << self
    end

    def self.create_legislators_votes
        t = Date.today
        prev = t - 30
        Legislator::CHAMBERS.each do |chamber|
            uri = BASE + chamber + "/votes/#{prev.to_s}/#{t.to_s}.json"
            APICall.get_legislators_votes(uri).each do |vote|
                new(vote)
            end
        end
    end
end