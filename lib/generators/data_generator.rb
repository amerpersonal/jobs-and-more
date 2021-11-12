module Generators
  module DataGenerator

    def dummy_persons
      url = "https://randomuser.me/api/?results=100&inc=name,location,email,dob,cell,picture"

      response = Faraday.get url

      people = []
      if (response.status == 200)
        people = JSON.parse(response.body)['results']
      else
        Rails.logger.info("Request to URL #{url} failed with #{response.status} : #{response.body}")
      end

      people
    end
  end
end
