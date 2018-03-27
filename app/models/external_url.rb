# Helper model to validate urls. Makes use of the validate_url gem.
# Urls must be fully formed
# e.g.  http://www.google.com or https://www.google.com are valid
#       www.google.com is NOT valid
class ExternalUrl
  include ActiveModel::Validations

  attr_reader :path
  validates :path, url: true

  def initialize(path)
    @path = path
  end
end