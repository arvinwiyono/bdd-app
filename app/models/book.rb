class Book < ApplicationRecord
  belongs_to :user

  validates :name, :author, presence: true

  def inspect
    "#{name} - #{author}"
  end
end
