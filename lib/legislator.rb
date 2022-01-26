class Legislator
    BASE = "https://api.propublica.org/congress/v1/117/senate/members.json"
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
        APICall.get_legislators.each do |attrs|
            new(attrs) if attrs["in_office"]
        end
        assign_states
        all
    end

    def self.assign_states
        State.assign_legislators
    end
    
    def self.find_legislators_by_str(state_str)
        legislators = self.all.find_all{|rep|rep.state == state_str}
    end
end