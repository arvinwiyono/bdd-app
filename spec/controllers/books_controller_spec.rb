require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { instance_double(User) }
  before { log_in user }
  describe 'GET #index' do
    let(:books) {
      [
        instance_double(Book),
        instance_double(Book)
      ]
    }

    before do
      allow(user).to receive(:books).and_return(books)
      get :index
    end

    it 'looks up all books that belong to the current user' do
      expect(assigns(:books)).to eq books
    end
  end

  describe 'POST #create' do
    let(:book) { FactoryBot.build_stubbed(:book) }
    let(:params) { { name: 'Test Book', author: 'Test Author' } }

    before do
      allow(book).to receive(:save)
      allow(user).to receive_message_chain(:books, :build).and_return(book)
    end

    it 'saves the book' do
      post :create, params: { book: params }
      expect(book).to have_received(:save)
    end

    context 'when all params are supplied correctly' do
      before do
        allow(book).to receive(:save).and_return true
        post :create, params: { book: params }
      end

      it 'redirects to the book shoe page' do
        expect(response).to redirect_to(book_path(book))
      end

      it 'contains a success message' do
        expect(flash[:notice]).to eq('Book was successfully created.')
      end
    end

    context 'when book can\'t be saved' do
      before do
        allow(book).to receive(:save).and_return false
        post :create, params: { book: params }
      end

      it 'redirects back to the new page' do
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    let(:book) { FactoryBot.build_stubbed(:book) }
    let(:params) do
      {
        id: book.id,
        book: { name: 'New title' }
      }
    end

    before do
      allow(Book).to receive(:find).and_return book
      allow(book).to receive(:update).and_return true
    end

    it 'updates the book' do
      patch :update, params: params
      expect(book).to have_received(:update)
    end

    context 'when update succeeds' do
      before { patch :update, params: params }
      it 'redirects to the book show page' do
        expect(response).to redirect_to(book_path(book))
      end

      it 'shows a success message' do
        expect(flash[:notice]).to eq 'Book was successfully updated.'
      end
    end

    context 'when update fails' do
      before do
        allow(book).to receive(:update).and_return false
        patch :update, params: params
      end

      it 're-renders the edit page' do
        expect(response).to render_template('edit')
      end
    end
  end
end
