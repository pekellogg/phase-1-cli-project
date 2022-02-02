class State
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :legislators
    
    def initialize(name = nil)
        @name = name
        @legislators = []
        self.class.all << self
    end

    def self.assign_legislators
        State.all.each do |state|
            legislators = Legislator.find_legislators(state.name)
            state.legislators = legislators
        end
    end

    def self.create_states
        STATES.each do |state_str|
            state = State.new(state_str)
        end
    end

end