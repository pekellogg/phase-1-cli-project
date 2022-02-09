class APICall
    BASE = "https://api.propublica.org/congress/v1"
    PROPUBLICA = ENV.fetch("legislators_key")

    def self.get_legislators(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"][0]["members"]
    end

    def self.get_votes(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"]["votes"]
    end

    def self.get_positions(uri)
        response = RestClient.get(uri, headers = {"X-API-Key": PROPUBLICA})
        body = JSON.parse(response.body) if response.code == 200
        body["results"][0]["votes"]
    end
end