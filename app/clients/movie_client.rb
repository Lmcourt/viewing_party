class MovieClient
  class << self
    def fetch(url)
      url += "&api_key=#{ENV['movie_api_key']}"
      parse_data(conn.get(url)).take(40)
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://api.themoviedb.org')
    end
  end
end
