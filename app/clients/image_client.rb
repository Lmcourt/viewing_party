class ImageClient
  class << self
    def fetch
      parse_data(conn)
    end

    private

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.get('https://randomfox.ca/floof/')
    end
  end
end
