require 'rails_helper'

RSpec.describe ExternalUrl, type: :model do

  it 'valid? returns true when valid url' do
    expect(ExternalUrl.new('http://www.google.com').valid?).to be_truthy
  end

  it 'valid? returns false when invalid url' do
    expect(ExternalUrl.new('adfasdfadsf').valid?).to be_falsey
  end
end