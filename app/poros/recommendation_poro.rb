class RecommendationPoro
  attr_reader :id, :title

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
  end
end
