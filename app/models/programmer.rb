class Programmer < ActiveRecord::Base
	geocoded_by :City
	after_validation :geocode
	acts_as_gmappable :process_geocoding => false
end
