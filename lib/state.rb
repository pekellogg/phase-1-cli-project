class State
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]
    
    @@all = []

    def self.all
        @@all
    end

    def self.states_with_reps
        all = {}
        Legislator.all.each do |rep|
            if !all.has_key?(rep.state)
                all[rep.state] = [rep]
            else
                all[rep.state] << rep
            end
        end
        all
    end

    attr_accessor :name, :legislator_1, :legislator_2
    
    def initialize
        self.class.states_with_reps.each do |state, reps|
            @name = state
            @legislator_1 = reps[0]
            @legislator_2 = reps[1]
            @@all << self
        end
    end

end