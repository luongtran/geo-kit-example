class Location < ActiveRecord::Base
  attr_accessible :address, :zip_code, :lat, :lng


  acts_as_mappable
  before_create :more_infor

  private
  def more_infor
    geo = Geokit::Geocoders::MultiGeocoder.geocode self.address
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng, self.zip_code = geo.lat, geo.lng, geo.zip if geo.success
  end
end
