require 'rails_helper'

RSpec.describe 'Scraping', type: :request do
  let!(:scraping_results) { create_list(:scraping_result, 5) }
  let(:valid_attributes) do
    {
      task_id: 1,
      user_id: 1,
      url: 'https://www.webmotors.com.br/comprar/troller/tx4/32-tgv-4x4-20v-turbo-intercooler-diesel-2p-automatico/2-portas/2020-2021/52632739?lkid=2217'
    }
  end

  let(:invalid_attributes) do
    {
      task_id: nil,
      user_id: nil,
      url: nil
    }
  end

  describe 'GET /scraping_results' do
    it 'returns a success response' do
      get scraping_results_path
      expect(response).to have_http_status(:ok)
    end

    it 'returns all scraping results' do
      get scraping_results_path
      expect(JSON.parse(response.body).size).to eq(5)
    end
  end

  describe 'POST /scrape' do
    context 'with valid params' do
      it 'creates a new scraping result' do
        expect do
          post '/scrape', params: valid_attributes
        end.to change(ScrapingResult, :count).by(1)
      end

      it 'renders a JSON response with the new scraping result' do
        post '/scrape', params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)['status']).to eq('Scraping completed successfully')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new scraping result' do
        post '/scrape', params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include('URL is missing')
      end
    end
  end
end
