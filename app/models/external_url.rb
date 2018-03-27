class ExternalUrl
  include ActiveModel::Validations

  attr_reader :path
  validates :path, url: true

  def initialize(path)
    @path = path
  end
end