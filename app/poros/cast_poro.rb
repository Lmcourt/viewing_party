class CastPoro
  attr_reader :character, :name

  def initialize(data)
    @character = data[:character]
    @name = data[:name]
  end
end
