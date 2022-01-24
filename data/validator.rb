class Validator
    # k_count == 50
    # v_count == 100 or 102 depending on if former legislators are omitted
    def self.qa_states_with_reps
        k_count = 0
        v_count = 0
        State.states_with_reps.each do |k,v|
            k_count += 1
            v.each{v_count += 1}
        end
        puts "k_count: #{k_count}"
        puts "v_count: #{v_count}"
    end

    def self.qa_state_initializer
        state_total = 0
        State.states_with_reps.each do |state, reps|
            count = 0
            state_total += 1
            puts "Name: #{state}"
            reps.each{count += 1}
            puts "Reps count: #{count}"
        end
        puts "State total: #{state_total}"
    end
    
    def self.qa_former_legislators_2022
        Legislator.former_legislators_2022.each do |rep|
            puts "#{rep.first_name} #{rep.last_name}"
        end
    end
end