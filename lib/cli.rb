class Cli
    def self.start
        welcome
        app_mission
        menu
        puts ""
        puts ""
        
        puts "What next? Please select by number."
       
        puts ""
        puts ""

        selection = gets.strip

        binding.pry

        
        case selection
        when 1
            senators
        when 2

        when 3

        when 4
            
        end
    end

    # call sleep 
    def self.welcome
        puts "Hello, citizen!"
        puts "Welcome to DemocracyNOW, an app for voters to find their senators, minus the angry pundit rants of popular news media."
        puts "What are they so mad about, anyway?"
    end

    def self.menu
        puts "1 - Find senators"
        puts "2 - Senator voting information"
        puts "3 - Senator campaign financing information"
        puts "4 - Where is this data from?"
        puts "5 - Exit"
    end

    def self.senators
        puts "Which US state do you want info for?"
            puts "For example, Washington state voters would type WA."
            user_state = gets.strip

        if state = State.all.find{|state|state.name.casecmp?(user_state)}
            puts "In the state of #{state.name}, your senators are..."
            puts "#{state.legislator_1.first_name} #{state.legislator_1.last_name}"
            puts "#{state.legislator_2.first_name} #{state.legislator_2.last_name}"
        else
            puts "I didn't understand that."
            puts "Please try again with your state's two-letter abbreviation."
            self.senators
        end
    end

    # add call to sleep between long sentences, find gem that makes text appear as if it's being typed(?)
    def self.app_mission
        puts "In a functioning democracy, we think voters have a right to local civic information."
        puts "(Think-- who are my state's senate and house representatives? what are they doing this week?)"
        puts "Americans deserve a voter-centric tool organized around the '101 of local politics."
        puts "We think the basics should be... well, basic."
    end

    def self.works_cited
        puts "The data in this app have been unmodified are provided by ProPublica."
        puts "ProPublica requires us to let you know that the data herein may contain errors and omissions from time to time."

        puts ""
        puts ""
        puts ""

        puts "'ProPublica Campaign Finance API' and 'ProPublica Congress API' by ProPublica is licensed under Creative Commons Attribution-NonCommercial-NoDerivs 3.0 United States."
        puts "Documentation:"
        puts "1. https://projects.propublica.org/api-docs/campaign-finance/"
        puts "2. https://projects.propublica.org/api-docs/congress-api/"
        
        puts ""
        
        puts "URIs:"
        puts "1. https://api.propublica.org/campaign-finance/v1"
        puts "2. https://api.propublica.org/congress/v1"

        puts ""

        puts "View additional licensing information at https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
    end
end