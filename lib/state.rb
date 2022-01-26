class State
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :legislator_1, :legislator_2
    
    def initialize(name = nil, legislator_1 = nil, legislator_2 = nil)
        @name = name
        @legislator_1, @legislator_2 = legislator_1, legislator_2
        self.class.all << self
    end

    def self.assign_legislators
        State.all.each do |state|
            legislators = Legislator.find_legislators(state.name)
            state.legislator_1 = legislators[0]
            state.legislator_2 = legislators[1]
        end
    end

    def self.create_states
        STATES.each do |state_str|
            state = State.new(state_str)
        end
    end

end