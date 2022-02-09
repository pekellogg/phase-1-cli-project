class Vote
    @@all = []
    def self.all
        @@all
    end

    def initialize(attributes)
        attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        self.class.all << self
    end

    def self.create_votes
        APICall.get_votes(APICall::BASE + "/both/votes/#{(Date.today - 30).to_s}/#{Date.today.to_s}.json").each{|vote|new(vote)}
    end

    def display
        if self.chamber.casecmp?("house") && self.bill != {} && self.vote_type != "QUORUM"
            puts "Bill number: #{self.bill["number"]}"
            puts "Bill Title: #{self.bill["title"]}"
            puts "Latest action: #{self.bill["latest_action"]}"
        end
        puts "Date: #{self.date}"
        puts "Description: #{self.description}"
        puts "Vote type: #{self.vote_type}"
        puts "Question: #{self.question}"
        puts "Result: #{self.result}"
        puts "Yes: #{self.total["yes"]}" + "  " + "No: #{self.total["no"]}" + "  " + "Not voting: #{self.total["not_voting"]}" if self.total["not_voting"] > 0
        puts ""
        puts ""
    end

end