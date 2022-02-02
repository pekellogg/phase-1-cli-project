class APICall
    def self.get_legislators(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": ENV.fetch("legislators_key")})
        body = JSON.parse(response.body) if response.code == 200
        legislators = body["results"][0]["members"]
    end

    def self.get_legislators_votes(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": ENV.fetch("legislators_key")})
        body = JSON.parse(response.body) if response.code == 200
        votes = body["results"]["votes"]
    end

    # Tammy Baldwin id
    def self.get_votes_by_legislator
        response = RestClient.get("https://api.propublica.org/congress/v1/members/B001230/votes.json", headers = {"X-API-Key": ENV.fetch("legislators_key")})
        body = JSON.parse(response.body) if response.code == 200
        legislator_votes = body["results"][0]["votes"]
        binding.pry
    end
end