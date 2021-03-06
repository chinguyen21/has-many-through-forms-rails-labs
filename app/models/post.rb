class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories, reject_if: proc {|attributes| attributes['name'].blank?}

  # def categories_attributes=(categories_attributes)
  #   if categories_attributes.values[0][:name] != ""
  #     self.categories << Category.create(name: categories_attributes.values[0][:name])
  #   end
  # end

end
