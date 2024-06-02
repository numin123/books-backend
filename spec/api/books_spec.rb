require 'rails_helper'

RSpec.describe Books, type: :request do
  describe 'POST /api/books' do
    let(:valid_attributes) do
      {
        title: 'Test Book',
        short_description: 'This is a short description',
        full_description: 'This is a full description'
      }
    end

    context 'when the request is valid' do
      before { post '/api/books', params: valid_attributes }

      it 'creates a new book' do
        expect(response).to have_http_status(201)
        expect(json['title']).to eq('Test Book')
        expect(json['short_description']).to eq('This is a short description')
        expect(json['full_description']).to eq('This is a full description')
      end
    end

    context 'when the request is invalid' do
      before { post '/api/books', params: { title: 'Test Book' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(400)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/short_description is missing/)
        expect(response.body).to match(/full_description is missing/)
      end
    end
  end
end
