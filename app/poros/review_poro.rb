class ReviewPoro
  attr_reader :author, :content

  def initialize(data)
    @author = data[:author]
    @content = data[:content]
  end
end
