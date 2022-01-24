class State    
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

    def self.create_from_legislators
       Legislator.all.each do |rep|
            state = self.class.new
            @name = rep.state
            reps = State.states_with_reps[state.name]
            @legislator_1 = reps[0]
            @legislator_2 = reps[1]
            binding.pry
        end
    end

    attr_accessor :name, :legislator_1, :legislator_2
    
    def initialize
    end

end