require 'rails_helper'

RSpec.describe Book, type: :model do
  # Associations
  it { is_expected.to belong_to :user }

  # Columns
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:author).of_type(:string) }

  # Validations
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :author }

  let(:user) { FactoryBot.create(:user) }
  let(:book_name) { 'Title' }
  let(:author_name) { 'Someone' }
  subject{ described_class.new(user: user, name: book_name, author: author_name) }

  it 'returns my custom inspect message' do
    expect(subject.inspect).to eq "#{book_name} - #{author_name}"
  end
end
