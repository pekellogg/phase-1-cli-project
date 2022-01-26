class APICall
    def self.get_legislators
        # use dotenv gem to hide key
        response = RestClient.get(Legislator::BASE, headers = {"X-API-Key": ENV.fetch("legislators_key")})
        # response = RestClient.get(Legislator::BASE, headers={"X-API-Key" => "ngnEYSULS5Z08XA7WawN0bPwK7ZRAuvrxIKqlH7U"})
        body = JSON.parse(response.body) if response.code == 200
        legislators = body["results"][0]["members"]
    end
end