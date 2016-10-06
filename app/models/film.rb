class Film < ActiveRecord::Base
  #instance method
  belongs_to :genre
  belongs_to :director

  def self.total_sales
    Film.sum("box_office_sales")
  end
end
