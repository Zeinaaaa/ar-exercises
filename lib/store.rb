class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { greater_than_or_equal_to: 0 }

  def at_least_one_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, 'must have at least one type of apparel')
      errors.add(:womens_apparel, 'must have at least one type of apparel')
    end
  end
end