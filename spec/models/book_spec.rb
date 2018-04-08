require 'rails_helper'

RSpec.describe Book, type: :model do
  # Associations
  it { is_expected.to belong_to :user }

  # Columns
  it { is_expected.to have_db_column(:name).of_type(:string) }
  it { is_expected.to have_db_column(:author).of_type(:string) }
end
