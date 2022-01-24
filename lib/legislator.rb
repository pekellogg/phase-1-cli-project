class Legislator
    BASE = "https://api.propublica.org/congress/v1/117/senate/members.json"

    @@all = []
    
    def self.all
        @@all
    end

    def self.former_legislators_2022
        self.all.map.select{|rep|rep.in_office == false}
    end
    
    def self.drop_former_legislators_2022
        former_legislators_2022.each{|rep|Legislator.all.delete(rep)}
    end

    # stops Loeffler & Harris from persisting here
    def self.create_legislators
        APICall.get_legislators.each do |legislator_attrs|
            Legislator.new(legislator_attrs)
        end
        Legislator.drop_former_legislators_2022
        Legislator.all
    end

    # main attrs & joining attrs
    #short_title, #first_name, #last_name, #state, #phone
    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        self.class.all << self
    end
end