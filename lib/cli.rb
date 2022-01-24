class Cli
    def self.start
        puts "Hello, citizen!"
        puts "In which US state are you currently registered to vote?"
        puts "For example, Washington state voters would type WA."
        users_state = gets.strip

        # call to state class for validation
        if State::STATES.include?(users_state)
            # senators returned per state with name, phone #
            self.menu
        else
            puts "I didn't understand that."
            self.start
        end
    end

    def self.menu
        puts "1. Find state senators."
        puts "2. Continue to senators' voting information..."
        puts "3. Continue to senators' campaign financing information..."
        puts "4. About App's mission and resources..."
        puts "5. Exit app."
    end

    def self.about_app
        self.app_mission

        puts ""
        puts ""
        puts ""

        self.works_cited
        
        puts ""
        puts ""
        puts ""

        self.menu
    end

    def self.app_mission
        puts "For a functioning democracy, it is paramount that voters have quick access to accurate, basic civic information."
        puts "Americans deserve a voter-centric tool organized around the basic mechanisms of local politics."
        puts "Quick and easy access allows for careful scrutiny of a representatives' legislative actions."
    end

    def self.works_cited
        puts "Underlying ProPublica data of this application has been unmodified."
        puts "The data herein may contain errors and omissions."
        puts "In the event that the data is updated, the user is responsible for checking their site."

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

        puts "View license information at https://creativecommons.org/licenses/by-nc-nd/3.0/legalcode"
    end
end