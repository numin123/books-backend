require 'rails_helper'

RSpec.describe 'Books API', type: :request do
  before do
    Rails.cache.clear
    Base.helpers { def authenticate!;true;end }
  end

  describe 'POST /api/books' do
    let(:valid_params) do
      {
        title: 'New Book',
        short_description: 'Short description',
        full_description: 'Full description',
        author: 'Author'
      }
    end

    it 'throttles requests after limit is reached' do
      5.times do
        post '/api/books', params: valid_params
        expect(response).to have_http_status(201)
      end

      post '/api/books', params: valid_params
      expect(response).to have_http_status(429)
    end
  end
end
