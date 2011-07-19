class Perspectiva < ActiveRecord::Base
  belongs_to :dimension
  has_many :indicadors
end
