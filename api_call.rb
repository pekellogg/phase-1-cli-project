class APICall

    def self.get_data
        create_legislators
    end

    def self.get_legislators
        response = RestClient.get(Legislator::BASE, headers={"X-API-Key" => "ngnEYSULS5Z08XA7WawN0bPwK7ZRAuvrxIKqlH7U"})
        body = JSON.parse(response.body) if response.code == 200
        
        # legislators total == 102; (Kamala Harris & Kelly Loeffler)
        legislators = body["results"][0]["members"]
    end

    def self.create_legislators
        get_legislators.each do |legislator_attrs|
            Legislator.new(legislator_attrs)
        end
        Legislator.all
    end
end