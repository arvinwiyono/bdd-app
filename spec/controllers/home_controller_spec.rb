require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user){ instance_double(User) }
  before { log_in(user) }

  describe '#index' do
    it 'returns status ok' do
      get :index
      expect(response.status).to be 200
    end
  end
end
