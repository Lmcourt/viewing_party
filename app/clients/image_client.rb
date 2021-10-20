class ImageClient
  class << self
    def fetch
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def response
      Faraday.get('https://randomfox.ca/floof/')
    end
  end
end
