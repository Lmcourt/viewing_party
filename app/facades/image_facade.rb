class ImageFacade
  class << self
    def image
      ImageClient.fetch[:image]
    end
  end
end
