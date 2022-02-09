class Cli
    def self.start
        welcome
        menu
        puts ""
        puts ""
        puts "What next? Please select by number."
        puts ""
        puts ""
        selection = gets.strip.to_i

        case selection
        when 1
            legislators
        when 2

        when 3
            works_cited
        when 4
            
        end
    end

    def self.welcome
        puts "Hello, citizen!"
        puts "Welcome to FedLookup, an app for voters to find the representatives in their state."
    end

    def self.menu
        puts "1 - Show representatives"
        puts "2 - Representative voting information"
        puts "3 - About the data in this app"
        puts "4 - Exit"
    end

    def self.legislators
        puts "Which state are you registered to vote in?"
            puts "For example, Washington state voters would type 'WA'."
            user_state = gets.strip

        if state = State.all.find{|state|state.name.casecmp?(user_state)}
            # puts "In the state of #{state.name}, your representatives are..."
            # puts "#{senator 1 info}"
            # puts "#{senator 2 info}"
        else
            puts "I didn't understand that."
            puts "Please try again with your state's two-letter abbreviation."
            legislators
        end
    end

    def self.works_cited
        puts "The data in this app have been unmodified are provided by ProPublica."
        puts "ProPublica requires us to let you know that these data may contain errors and omissions from time to time."
        puts ""
        puts ""
        puts ""
        puts "''ProPublica Congress API' by ProPublica is licensed under Creative Commons Attribution-NonCommercial-NoDerivs 3.0 United States."
        puts "Documentation available at: https://projects.propublica.org/api-docs/congress-api/"
        puts ""
        puts "URI: https://api.propublica.org/congress/v1"
        puts "View additional licensing information at https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
    end
end