class Car < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :mileage
  attr_accessible :year
  attr_accessible :manufacturer
  attr_accessible :category
  attr_accessible :seats
end