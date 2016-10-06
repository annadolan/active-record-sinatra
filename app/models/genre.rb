class Genre < ActiveRecord::Base
  has_many :films

  # def films
  #   Film.where(genre_id: self.id)
  # end
end
