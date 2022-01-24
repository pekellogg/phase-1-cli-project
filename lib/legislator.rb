class Legislator
    BASE = "https://api.propublica.org/congress/v1/117/senate/members.json"

    @@all = []
    
    def self.all
        @@all
    end

    # main attrs & joining attrs
    #short_title, #first_name, #last_name, #state, #phone
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
    end
end