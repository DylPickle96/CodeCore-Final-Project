class Post < ApplicationRecord
  belongs_to :user
  has_many :conversations, dependent: :destroy

  before_validation :titleize_make
  geocoded_by :address
  after_validation :geocode

  validates :make, presence: {message: 'Must be provided.'}
  validates :model, presence: {message: 'Must be provided.'}
  validates :odometer, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :model_year, numericality: { greater_than_or_equal_to: 0 }
  validates :condition, presence: {message: 'Must be provided.'}
  validates :cylinders, numericality: { greater_than_or_equal_to: 3, less_than_or_equal_to: 12 }
  validates :drivetrain, presence: {message: 'Must be provided.'}
  validates :fuel, presence: {message: 'Must be provided.'}
  validates :paint_colour, presence: {message: 'Must be provided.'}
  validates :title_status, presence: {message: 'Must be provided.'}
  validates :transmission_type, presence: {message: 'Must be provided.'}

  mount_uploader :image, ImageUploader

  private

  def self.search(search_term)
    if search_term
      where('make || model || model_year LIKE ?', "%#{search_term.capitalize}%").order('id DESC')
    else
      order('id ASC')
    end
  end

  def titleize_make
    self.make = make.titleize if make.present?
  end
end
