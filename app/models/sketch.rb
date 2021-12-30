class Sketch < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  before_create :set_upvotes

  def set_upvotes
    self.upvotes = 0
  end
end
