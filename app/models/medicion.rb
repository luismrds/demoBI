class Medicion < ActiveRecord::Base
  belongs_to :medidor
  belongs_to :fecha
end
