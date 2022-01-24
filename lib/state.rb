class State
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :abbreviation, :legislator_1, :legislator_2
    
    # def initialize(abbreviation=nil, legislator_1=nil, legislator_2=nil)
    #     # assign attributes
    #     @@all << self
    # end

end