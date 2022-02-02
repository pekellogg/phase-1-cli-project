class Legislator
    CHAMBERS = ["senate", "house"]
    BASE = "https://api.propublica.org/congress/v1/117/"
    BASE_CIVIC = "https://www.googleapis.com/civicinfo/v2/representatives.json"
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

    def self.create_legislators
        CHAMBERS.each do |chamber|
            uri = BASE + chamber + "/members.json"
            APICall.get_legislators(uri).each do |attrs|
                new(attrs) if attrs["in_office"]
            end
        end
        assign_states
        all
    end

    def self.assign_states
        State.assign_legislators
    end
    
    def self.find_legislators(state_str)
        self.all.find_all{|rep|rep.state == state_str}
    end
end