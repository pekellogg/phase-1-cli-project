class APICall

    def self.get_data
        Legislator.create_legislators
        State.new
    end

    def self.get_legislators
        response = RestClient.get(Legislator::BASE, headers={"X-API-Key" => "ngnEYSULS5Z08XA7WawN0bPwK7ZRAuvrxIKqlH7U"})
        body = JSON.parse(response.body) if response.code == 200
        
        # legislators total == 102; (Kamala Harris & Kelly Loeffler)
        legislators = body["results"][0]["members"]
    end
end